Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D6C17261
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 23:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80E710E136;
	Tue, 28 Oct 2025 22:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ki0Mq75I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGM7SB9i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556210E136
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 22:14:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlGv72616680
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 22:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1me6Y331o4LK9HXk4HeTnXtF
 sN7EPXvCiOq7Qn53yrY=; b=Ki0Mq75I+m1RfqsuDmfGYFvJ8srrwhheO6+un7HK
 cuY2kmSa0krklte3J82ZZiXXye7kaOKJZ09p+IbaPELIN7tuyVoIHyzxFCv4eLNC
 gLcBMxQn5lUgtVDF7kJrQB1pZCBxo8vb1PGXj3lQsJV3l164rmc/NO39XbmBAAYc
 f7uVj7XZc371eLRejWKFjwLXBBWcw7MI234VfLkGFdSTa+niEuQ7SSEsafg/UaU3
 +NxgAIwH68Pc++9FT/Dr7Icw+U3Ioo/1LecGv5uiSMifNPkRSgVCuYiuhJyfMo7s
 kbBTLrdJd3kozhZpgzsVZsrLz6ncNgxINORIzBZtitCw4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y0b12-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 22:14:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba10ad6e1so63322871cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761689654; x=1762294454;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1me6Y331o4LK9HXk4HeTnXtFsN7EPXvCiOq7Qn53yrY=;
 b=EGM7SB9i4942S4QUVzJYzg0C8cPGGenCKeApan8T1sJEqhV0IN4ie5j953sxk1KvS1
 fra4jEEQVUXEUSkZeUVt+NmFpLCl4Cq6TwBcL2OgFXovFcrkqosMGN9avIv4L61uZ3fQ
 PXOAfYL2uxsadxVE55ruYOL2xjMvX60FwHwYC3iJA4L0aUuyNYCdWYa/ME4bLNPvJ//4
 AZwz87LFFFKCpFtMPeFe63eEV+2tWFxsnh9+8icw6qUkRW8l3KQPiAD33BnkxNHtixB2
 kAcHP0JkfJaTxJcqppxAltIHl9VUbVcn/UASzCmpwxiuItvi1pspPOXO/8IaDC8Ku533
 KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761689654; x=1762294454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1me6Y331o4LK9HXk4HeTnXtFsN7EPXvCiOq7Qn53yrY=;
 b=Z7J7ia+GpP+11Ptp3Ezz5LkgDEW1yYXph5s8bB1ccPWrtTJDpVky0dlYbSAcvGarIs
 Sx4ReFYbEmPXFSwY3NTr5YIqaV1+QV8BF+3oAeVTDfQSGMziG2ya/3DzRkeNyGBFQLK2
 S9g/dYwu62YwhVM+Z4SH3YMTUBTTZQaYAcv3lUAcYvZKd5UUfmN3At0wryOSZWY017t/
 Jo/umJVb/LItB0ACz1i0UjfTrocNuNcFIdMe+8SnVI4ZSzZXC6r83YelS7pLyl3PzVG6
 SQBnIEsWv+4/k8r7pMfVBS613LLtYq2eAP0H3pJk/9YV8XZMYc802jqA6DxbofUJxKb8
 hrPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU30tYvyHWCuN7t+OsxUc3bntvIcO1njW67P/GHIqorc14KEqy8s3Ynyn/GSszOOrCIwmms5GkfWsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2YZI2cidHKu1kbgNVY1EkyXP08EC3cSbhmzw/G/3nVyO7rOjd
 8xRY3FFEBnXqRngJpCoq8AmxF0QjRcO9qOQ9LZURmXhOFNxZGbSWv/glsn7nOhfVT0tAOY8EDEv
 D9ENdgE1hFQmN97VvLBxN7CLu92U3AlSV9XpMriEu7mQrNlIcHyeGnS+0MdjpBfLw/CfnKHc=
X-Gm-Gg: ASbGncu9BfJvfL+1EqSCPopiw1AOAixWWaWwmbjf7yNnEf3Bp544dnwuZSLyD7gYSAi
 MQnBEqzRahW0tbhthswNJA5ErqaLQBJyC7oBx2sNglSjYwfKSBCZC+fp3AO2Y+bpkQaMkGbAyBd
 xM92FCjBcQvwPfu1cDMGZ0QqVAYyFgFDbdxN3DtAK2k5244Xiqa0AYkNKR/PfBvNAnqSWAq25FJ
 hDuU4oO/mVC0WFO81RF7s2soZcbGqPxVz98HjZ9EXUanA5qwmsWaUUG+XCrAA5ZYNur/Zp6QIOL
 j3rN4C9Qej2E2SMhqHViQ95rtiXc3zSMQ71IviEOoDT2BdgLuL7j5v45RZMRCc8sDVavfNpdU/H
 r4gBxOvQqMKWz/qoFV28xnNPoDe7c0RRA839yXBH6o2KRmM/UjLHB0Q1JBuOb8PujwWPXrvoI67
 J30QQ5K/0/jQwn
X-Received: by 2002:a05:622a:8b:b0:4eb:d84d:f8a8 with SMTP id
 d75a77b69052e-4ed15c765b8mr13810261cf.83.1761689654133; 
 Tue, 28 Oct 2025 15:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEaAR+XeAuLNAUIx0RF3XIOtIX1rvFmAxnu86IueWYjWEDGa8UW2uPoQg5lQeuV8zGvL1PoQ==
X-Received: by 2002:a05:622a:8b:b0:4eb:d84d:f8a8 with SMTP id
 d75a77b69052e-4ed15c765b8mr13809811cf.83.1761689653577; 
 Tue, 28 Oct 2025 15:14:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bfesm3335363e87.14.2025.10.28.15.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 15:14:11 -0700 (PDT)
Date: Wed, 29 Oct 2025 00:14:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Message-ID: <uoavlz3rejw4ntnyq5kwf3fy7zjtbnrldqvwj5tqtahee6kxne@nhx5wgo4zizv>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=69014037 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kAP0dVoXV5zkFeC1rmcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: T56zA-zLlI1SZTl1NFXxzq7nsQJSB029
X-Proofpoint-ORIG-GUID: T56zA-zLlI1SZTl1NFXxzq7nsQJSB029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4NyBTYWx0ZWRfX22sgDPANxsux
 NlJOMYNUfvM6/c8L14qlMH8/dnq6jtqRnirUqrQiCAzY0op7efkrcsxALffsG5CoGCxUcIbihmu
 DPE6LCwMKyc+7LK4xl33JH9pC9iSL/GEazrTMSrotKyjmF2ScVQRTbRHxuwhpu7PXE3Vym9voOg
 dE3lez/Lg22P7W8huaUegWGHeKLQ1BJKFVzr6LFTldkZ4r7Z5e+Ami5xxA5yTefn1Y4I9aR29dD
 /kEt6YX2qoHnGTUWZk+S5WTgxpOxu1VGnX301iNj9hJtZTvYTdgwZxAJ5Hohwno6zOkl03FQ1NP
 2EP8bXImY2BCEo7wPX3ZwbCHLzQL5UtdmBxQPDsfEXRHz3dRO/Zdlv7iCnQA0Shr2vGJvfwmh2c
 irCMRHZhSxfx5GuxKqX9uUtENrD5lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280187
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

On Sat, Oct 18, 2025 at 02:33:43PM +0000, Vladimir Lypak wrote:
> YUV formats on this hardware needs scaling for chroma planes. However it
> is not implemented for QSEED2 which breaks display pipeline if YUV format
> is used (causing partial and corrupted output with PPDONE timeouts).
> This patch temporarily disables YUV by switching affected sub-block to
> RGB only format list.
> 
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
