Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B62A49ABD
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 14:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751210E2A5;
	Fri, 28 Feb 2025 13:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFVvvKO5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1983E10E29B
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:41:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXD3x001790
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nxMCwl4XpxYnWA6xmBkQbDigvX+AcrDze/AyDFhTQLo=; b=OFVvvKO50iAK6F4O
 7oBdGSE93x+vZbkODA6AyP+uDUwURPPWquO3ElfzXrZ6xUagG/WUH23epzsHHELG
 k4Brn0xhLfkPJ75YDEpFQmLXPCGbUJBbMELT7aXfoL/hxROIaXGa6IjQb8QOilaP
 NYfDrJauA0CtPVZwBTCg1zoLaiD/Fc/fMTOsLScChCS9Vgjmoqy2xZ0jUOCHV061
 gMbgZvOhWFk8wfGQZMTV6eY4yn7EIiRUuF+88oY143hoD0u3vxktCcB+IzVVjmdo
 XX8OCjgmNFJX/SFyamIU4OveawDJPN6xvv1nGXUWe9mJe77RaI0NIClIZjYtac/0
 4QKIfw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452ynwtdx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:41:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e89902aaa5so3229916d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 05:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750083; x=1741354883;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nxMCwl4XpxYnWA6xmBkQbDigvX+AcrDze/AyDFhTQLo=;
 b=Katc6rzF3m5svoc5OcfvZCm6M3FiLkL2wRoTqh13foGXtXh1Xc25ueeRmdQy4CPjIc
 ww6kH19P2q2zI3C9wPvt6EV3xXne46pBY/r+0pZREY7js53chCAdgME/5KYtzKsw4SxR
 rcuS0DQ2EpVdBU9IHnhBNgTb4huT275QImzi0GZsxX+yddMFW05AFcaLLURgHqmt+LbY
 2LwlYevgBs3n+S6DTTuR5dTC5NbHDstYesRrFgpwYlxQ0WFtHv6e4aA40WRkOOUKDry5
 lniOYaniae0kqLVGPVSl+cmp/dJcbYZiVa3MJuffVC5imBNBAE2ZSh1OOdWxZQgX8OOe
 ZSqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV15DqVCPpQB0PkrJlXp2DRYfj+9iCO0ziR/BTAgxPXWxoAmBphWgUhqRU8WH/MnRrxsN/hYgacxHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc8thYRqhA62CaVu+vkKJZJ8wakXzvfbMxArnrniPE7IsYpKDz
 iKq/t6UPPNqcUoiKCzrpJY+me/HszBcIH7sXetGg8n6ru7XxdF48xP/qIF6IdP4+YwvOpBlGoxL
 X627at+6UpP8ImZnuO3emowuW4Cgt0G3Zt0jQQdFwHKwoPJnlNSD5t9LXc7yY+975SgI=
X-Gm-Gg: ASbGncsXrf8kkWoDAj4XuzYjReUZ24BWw7s+r+dStSt1vl/HfBDIDoQIDO/zW737uVX
 u9VxwecIpufskwInEZuOA89+MR3wZ6a6ucWNwruG+qc8SZ5JksUZnO5whjy9iupxz330v8LPHPp
 7GuquTcqjUFlFwdOHXWVePn43iPdFKEzAiA9q0PCiHXsg9ktZ/DxfjrX+6FuA/xN32pJP/yxbgv
 v74Gz/nKsunpfz29ykppOD2I0o5Pn2p9h/pnnzGHIftg9AZaDO8k/BkfjVzF0uUTbVWbqDqJi5R
 kBeA3ys40s9HNxKvuQXUtrcLDFKJU8KkJUFBx+fMDH6s6iUu/8MzIq34o0fJQtpc2sFlCg==
X-Received: by 2002:ad4:5f87:0:b0:6e6:5d99:d1a5 with SMTP id
 6a1803df08f44-6e8a0ace905mr19202306d6.0.1740750082798; 
 Fri, 28 Feb 2025 05:41:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjQWfIes2GbLXuXvq0DgihsoT/bAGgb6fDqf/KTL8rxJT7bL7aWTL0JdWW7i7ONoFuTU1Q7A==
X-Received: by 2002:ad4:5f87:0:b0:6e6:5d99:d1a5 with SMTP id
 6a1803df08f44-6e8a0ace905mr19202076d6.0.1740750082389; 
 Fri, 28 Feb 2025 05:41:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf42c16af2sm30308466b.116.2025.02.28.05.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:41:21 -0800 (PST)
Message-ID: <9325e4cf-425d-4fca-a458-20cdee6e4111@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rS9qeVR__nVqtSuQAzyaIS0glaarpwsr
X-Proofpoint-GUID: rS9qeVR__nVqtSuQAzyaIS0glaarpwsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=905 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280099
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
      ^
in all patches

Konrad
