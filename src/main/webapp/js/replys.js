const replyBtns = document.querySelectorAll("#replyBtn");

replyBtns.forEach(btn => {
  btn.addEventListener('click', toggleReply);
});

async function getReply(memoId) {
  const url = `/mall/reply?memoId=${memoId}`;
  const response = await fetch(url);
  return response.json();
}

function showReply(memoId, replys) {
  const replyView = document.querySelector(`[data-id="${memoId}"]`);
  const replyArray = Array.isArray(replys) ? replys : [replys]; // 배열로 변환
  let ul = `<ul>`;
  replyArray.forEach(reply => {
    ul += `<li>${reply.contents}(${reply.writeDate}) - ${reply.customerName}</li>`;
  });
  ul += `</ul>`;
  replyView.innerHTML = ul;
  replyView.classList.remove('hidden');
}

function hideReply(memoId) {
  const replyView = document.querySelector(`[data-id="${memoId}"]`);
  replyView.classList.add('hidden');
}

async function toggleReply(event) {
  const memoId = event.target.value;
  console.log(memoId);
  const replyView = document.querySelector(`[data-id="${memoId}"]`);
  if (replyView.classList.contains('hidden')) {
    try {
      const replys = await getReply(memoId);
      showReply(memoId, replys);
    } catch (error) {
      console.error('Error fetching replys:', error);
    }
  } else {
    hideReply(memoId);
  }
}

const sendReplyBtns = document.querySelectorAll('#sendReplyBtn');

sendReplyBtns.forEach(btn => {
  btn.addEventListener('click', submitReply);
});

async function submitReply(event) {
  event.preventDefault();
  const memoId = event.target.value;
   const contentsInput = document.querySelector("#reple-"+ memoId);
  const contents = contentsInput.value; 
  if (contents === "") {
    alert("댓글 내용을 입력해주세요.");
    return;
  }

  try {
   let url = `/mall/reply?memoId=${memoId}&contents=${contents}`;
    const response =  await fetch(url);

    if (response.ok) {
    //  const replys =  await response.json();
      alert('성공');
     // showReply(memoId, replys);
    } else {
      alert("댓글 작성에 실패했습니다.");
    }
  } catch (error) {
    console.error("Error submitting reply:", error);
    alert("댓글 작성에 실패했습니다.");
  }
}