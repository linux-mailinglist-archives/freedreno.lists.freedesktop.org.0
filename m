Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295B8ABAEF3
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7AB10E1BC;
	Sun, 18 May 2025 09:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adQzHKR2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7B510E1D8
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9JjAH008005
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cassb7i5I8/SYZylgZkn2Lai
 Ek52xXRH5Ohypr5QZYk=; b=adQzHKR2kXA8BIRR3Kai8lgmv8my4rTW8F5Lo9Mv
 84JOrGTiZpixym+d5tEvtAyo7J6ykla60xAfumz6ZiZ7+eRiiG6HGx+sgX7IJ9zd
 MObM+pANPBeKL6/tq6uPTi/vHqnY00uCnzekngAgHiTPnfrdbODPI6NgnbJ/wEX0
 WSaQC0/y5+UbQS1wACa7oHoXvdmC00V0/RJYWvbmYrVBXU6EQSP186e8vfCPBRzI
 4aSPvVRG8D3fka2OiH07bZVhM354RlDA8dt7/9sO380ED17t6aDlJWGID79XkJHp
 00BaJPN7fYgUxj1H8g/TELlPuVKYVtzAE9rsO2ig34bdQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9sqrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5bb68b386so1155714185a.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560276; x=1748165076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cassb7i5I8/SYZylgZkn2LaiEk52xXRH5Ohypr5QZYk=;
 b=EpnNeN3HKIsT+aftzNcqg0ycVBmUL8yiwYsx5+PDtagX4+PeCj314Hb6xHM5rI6nb7
 1K4qsFw7dJ6oJncpdI7s/v+icxu09pB3LKFOK4HS5GD6Rn8U4e/DYRB+Lzhm5o2N8XyN
 QA4N5v7XBCon42aMqPJlnbW8DqzKJqxp+liklg5WE9O5zdFJhxUQmiboS9LThkKyUWRh
 71sJPf3wIQxAP57EZVoHYVju7hZiMlzDKM6E9LiKoRu6/gMKX00w9ZFOyovWD5QZs0ms
 lynLExS2FFnChaU99Uc+UV1NFNM7olXdpFfOGwCJs1m+ChAljyfGjaB1nD1U7D8qEEmQ
 d/Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIFH7gAaQutAN/pWJp/lPuGpKYzcUnpyyY8KgARWV+w8mXzj41TqlB1HbLFq1Cp0FfHBzTep1APoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAYPBD6spHMV6xUqZWu7kWDUs4O7bbIM46bki4c5zpILPrG2zR
 9U207z3X2V0nTnU82+N81sX4qrn6oMFeoELvXs+0bXAxmU9sQ8EMmbBpzDHMN4ILIcKXM+WkuZz
 wLCc2N0e7fmRD6AlUzutqAiQYSnCPN68Q6C+EKSXdOhmX2p1FUqqsAEyrKg/8n7PwD9qCYmI=
X-Gm-Gg: ASbGncsMwidYUoKdLnKaBDaIbyXgmDsjsmu154jMQBf9Lr1Ox3XoTMdneQBDGOBHvdq
 U9WAflj1X1rhdyc+l0jFlOAqdXekPn/p1wHirgG6bmvgaZjwqtWDFLZ1KpZC426a4C8TFENG4Rm
 gfOxw461irc95jtMWqJuOR7/NP+oocE91GKJtYC8MAqKiROmvng9g9dUoXg1/uTqPYnNydoZOy+
 OR1SRk96uJdAmBYUs8wXSnpFVq0bw0Xpp10sEHLCq+9T4COsa8M0VnYIKqCTqhvv3pscTLIG5QF
 xhHzhgdFR7DrRRxgBI08XkZ4KJbWjCxVcdbfCF+5oQKZb8P9R8UY0OufyusLksp3CgkcVzshIcU
 =
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7cd47fd378cmr1294154385a.47.1747560276257; 
 Sun, 18 May 2025 02:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC5ZqsVwWr6A16sgKTeonBBfbSpuGBerXLhUNTVdBGhWSe3zc15GZX5mKJSEeRqdCHfL4ZFQ==
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7cd47fd378cmr1294151685a.47.1747560275904; 
 Sun, 18 May 2025 02:24:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e701b684sm1359006e87.148.2025.05.18.02.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:24:33 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <aza7hgcraahr56qhmremmkfqqvpodgohzmn6iogwqx7x424hny@fopwt6tk3uyu>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: Z1mMGiExYcMOfy1AbjwjgsZm1e56FslA
X-Proofpoint-ORIG-GUID: Z1mMGiExYcMOfy1AbjwjgsZm1e56FslA
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=6829a755 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4NyBTYWx0ZWRfX61vi034j41qS
 wDZmkLT0we5NibknL2pmdbNdhnKn5hg716YWu4k4UefBepHiYsGtNnoniMYvssP5WB3YE16HFJ7
 +/VABSQGZL/TmlI8waYxmV/GKErqN2WlwGacGuavFqmkuG3Hin1d/71PoUahdkutWOBMpFlkgnj
 hBwxkS/1iw+jHkW7zGXndMcZNJaKX9EzEajuYFJSb8QdOIbJtZ9lzgzmUPdefm/MgvlMXudjIrn
 3fllby+Y4FkH9bB2zq9bFkm/L4Vpo3z4rJwJH1HCqka+cqGgfkEXgT7U1KSjkNXj+WsBpL5bWs4
 y212A/w7GHFIgT2+3FiUylrRyw0IW8lbLFSYQIExjK0VpUJIED9+xmRdO38TYAQfxg55DBw0ezk
 HDf89fc5+sDEDUEPbdiIEpMDzxkyN4X0xAJJMu/l166yKfkPSnhdljaSqAO64RVABlGF3F56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=808 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180087
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

On Sat, May 17, 2025 at 07:32:39PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
