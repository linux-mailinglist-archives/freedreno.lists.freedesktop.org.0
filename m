Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F62A986D9
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 12:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563A10E67C;
	Wed, 23 Apr 2025 10:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="omPMv5Bn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD42310E67D
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 10:12:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iG1b024116
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 10:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9+dBvSJd0zAUTLsCbjOYAkNRRWwJZJT51j7Z36fU19U=; b=omPMv5BndKDbKrT5
 eappybBz41373qpdmy1tnTX1OpgfRcToBTH/YhOpUC3LDqGXel1Be9EwY1iY6PY3
 X1FmrmpRVZQZM7I1r6Fr5Dt5pSKlmpPuFbcBcW1OregBVvyyQIbiD2ArH++wPCUA
 144vn83nwGFWakWHhJt88TRebrew5LBOcd/UY0n48+BrSvvG4ibAKBUfL1ucAOFP
 YY9MIYUKBlGlmxyf7/n/Uyd7c9Q/Ps/fMFiC2tK0gVYNegoETHVmsx9AUuo4seMT
 J+zh7zbD1E7/FVn0X3AEyXRnax+q8EwMz6KNTD6yGt2iIaZBZ0LI729U2zL5cAIe
 HWuDcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39qdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 10:12:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f3c21043so15752706d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 03:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745403134; x=1746007934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+dBvSJd0zAUTLsCbjOYAkNRRWwJZJT51j7Z36fU19U=;
 b=bYU1rdy/qf3JHIpYsayzYleoeaFeNNRx0nl3Kv0z+k5TBCCxdCEmjWTlQZSP1ZUluW
 hS8E4s8F2rmWCEPV12hNItKjVvfaGIYOQ0uTcrxExOpCUcy1PVmpm5B/jq9BMW4QVFI8
 0Ca6wygc7P89BVrMnX0vgvYujxi4plJbJuBSMP4iEJ1Ced5WJuKDjiz36Y4qSPAnlfC2
 ngG8QEzbzOAU9ofzwTgOPHpQiIiVRPAg/76oa2kmm9u6Y8BsxSEGOVSwBT18LTJNgXF5
 6esdcxVNaNCfSko/nkNeiIuMzACHEKig+pBg+apyh8c/RaKellOSpWqOoYtMO6kFOtNH
 VThg==
X-Gm-Message-State: AOJu0YxA0GZ0vR+nEG9jqJemsNH5BA6gqEoIkO7RSx7b9rHuz03BYt+L
 EsEuKQz4NQ8B1CqTgRL5yDXnGDJW/FvIk+E3fwW1uhDKiFjeByDlFPIC99C+lGSV45tF2k3DoMi
 FX76vMuQkZRzN+usZgxPnAX6GgheEZP4gpwC6UbY3nTjgiI7TsWm/U3VDzyIAIuDba00=
X-Gm-Gg: ASbGncuTL5Y1quM43+Lt6S8/6gm1EdY1SKkFRUAgwKN6AgblTTI+MdMG7D6WCaoFh15
 h0AtlOhS4vosMzWPzrtstaUi3CX3VUtZhgZSeLxCO7Qst0HSp4gMqGK/O6qNKaG311qMSPK8Al+
 ZyMTbWo2hxRFyLy8diVdNAnJfRqJ3Z3q5O0lKCaOHKu/tO99LJ5YwXMtGzLeeHaxo3eW8XNXitB
 z+Ox5XrkVRlINeEiFE5XSDt9WTwSgtpt4CuwYmBKmN4nE2SuWg+XKolyB2n6vOdDUaiBJ1igMhG
 6cffNiYXKTrgMY7rXAdrwVaPY4IVe8IqO+ZbW0V/3cQQ75fY3Uggd7LNUhuHHYm2HDk=
X-Received: by 2002:ac8:7c55:0:b0:476:652f:4dba with SMTP id
 d75a77b69052e-47d1b7a1420mr15734031cf.3.1745403133995; 
 Wed, 23 Apr 2025 03:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1c5hjU7bDVhPGcaGxJotrWjeTyrTEEbUpQnOrZAQ+6GVrQmeDxoOBmd2pT6N+VRVsBQkOlg==
X-Received: by 2002:ac8:7c55:0:b0:476:652f:4dba with SMTP id
 d75a77b69052e-47d1b7a1420mr15733841cf.3.1745403133607; 
 Wed, 23 Apr 2025 03:12:13 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6eefcf97sm779939666b.88.2025.04.23.03.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 03:12:13 -0700 (PDT)
Message-ID: <0cce7121-3a13-4a75-8f89-c2c2c737fc2b@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 12:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Be more robust when HFI response times out
To: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org
References: <20250422-msm-hfi-resp-fix-v1-1-b0ba02b93b91@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250422-msm-hfi-resp-fix-v1-1-b0ba02b93b91@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7fRcAUllEYwZfb-tSAYUv7wBntJDuLTp
X-Proofpoint-GUID: 7fRcAUllEYwZfb-tSAYUv7wBntJDuLTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MCBTYWx0ZWRfX3+RpMV3seaih
 g1dd8Dip1VkJYY6jY1SXpfH/fBhytzDKPXbaUXVKUgAeIMCnIZmhNBVxMyIotply8Yzg3+FWjCo
 AnZxezXLU4Ojt+sG1uKgI7O5nrpIPBchEr4nvNrQLQiLUOJo/eq5ebQpYHjxI8GlEHeCLiae9/e
 +uISVNbBSpF6O4BxfVP3qlOjVDkYCL+ve0xZnFvWO1OxoVzxk4fTLw31KLv7RzVZRUNJF8tlcK6
 4cAs1yElLHZiiD+0Ui6FZpI6kgH0fEYtgJ/dIwVHv0OexkMSSaeHxoLT/lWbXZ3bwSHuGBA9j8p
 yyewHmKtjSj0vOF+qnnpurXpTwT44m/C2iv6GqYHqgc7S8pk2kCIp50ao36IHADakvANMeJ2bCR
 8m/FsZCXu0yL26xBIut0AQ11pfVCWT7rZWB4kgO+pf+N3sHIc4aNeOsvhYU8woJg75K0g8Si
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808bcff cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=-SdSJ3g0f5efAq2XM2wA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=528 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230070
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

On 4/22/25 6:00 PM, Connor Abbott wrote:
> If the GMU takes too long to respond to an HFI message, we may return
> early. If the GMU does eventually respond, and then we send a second
> message, we will see the response for the first, throw another error,
> and keep going. But we don't currently wait for the interrupt from the
> GMU again, so if the second response isn't there immediately we may
> prematurely return. This can cause a continuous cycle of missed HFI
> messages, and for reasons I don't quite understand the GMU does not shut
> down properly when this happens.
> 
> Fix this by waiting for the GMU interrupt when we see an empty queue. If
> the GMU never responds then the queue really is empty and we quit. We
> can't wait for the interrupt when we see a wrong response seqnum because
> the GMU might have already queued both responses by the time we clear
> the interrupt the first time so we do need to check the queue before
> waiting on the interrupt again.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

[...]

> -		/* If the queue is empty our response never made it */
> +		/* If the queue is empty, there may have been previous missed
> +		 * responses that preceded the response to our packet. Wait
> +		 * further before we give up.
> +		 */
>  		if (!ret) {
> -			DRM_DEV_ERROR(gmu->dev,
> -				"The HFI response queue is unexpectedly empty\n");
> -
> -			return -ENOENT;
> +			ret = a6xx_hfi_wait_for_msg_interrupt(gmu, id, seqnum);
> +			if (ret)
> +				return ret;

I think we should keep the error print in the second-failure case

Konrad 
