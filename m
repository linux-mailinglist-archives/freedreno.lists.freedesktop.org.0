Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB09C16F4F
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A7410E66B;
	Tue, 28 Oct 2025 21:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnggW4ue";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gty/e23M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8A810E66F
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJmAxc2576426
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=buWf0Ypb6OYJRaVhj46HKhwl
 jA+c0LfBLxaOuJMXUF4=; b=TnggW4ueFlJVAw+iErtFvrfcjR0uJa/t/JJVhDMZ
 4i/rjpK4ZspqGXiWtLGp/TfOOLVY1C3+NE1PZRE3NnruanL2pn8JIacL4LPK8QyL
 NhhAE5P8Ji1VbYZL42ORQYoxc6bVtaGuAm3zd/s0EL6NBY8zE984xqQUHABe9Wxl
 7iIrHlHtzdUXjts02Pt2pke/uGNjmt+s8XDbp6IP6ZtY87yJ04FFRJhR70QtBowe
 95RGCM+0wS6cxqQrFPOT3EHTn03vA16oUf3Lcr30YyazdTPFoGh5fE2nrauwbf9d
 XwbAP0LSfhvV1vYrMEy8aUqgqNVPLuRKGbBPmCOGbfP1Jw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a207ks-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8a4ef35cc93so814190985a.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686740; x=1762291540;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=buWf0Ypb6OYJRaVhj46HKhwljA+c0LfBLxaOuJMXUF4=;
 b=gty/e23MxzmPw4uvmFmbPU7O4jwFdgeVaIEWtYNj+vh0G8jhteQP9Ws4sg/GOBq/hQ
 xnXPTyLnFwh6ZJXGrmBWkD1biZAXbtAdrc0BpTTgnT6PmkuXlTtaTZ2DUKP4sxQgczQK
 8rF/9h/EY6ZdmhWVrALA7QxzlsrjgYjw6VRDhZSaANR3pvUmz2jA+q6mMmVSn3w8WJ90
 Wa8kweWmHqfjqm7waxqRwdC6nkLpSBzy3dRWklw5Ww84e/58YZ7dAPrWl9hcbEyfn6jX
 3p3i6l9XT5y7A/FnyrTwdXylBkAJLADP7iAUxBYs4PlhbwOJQNtEWr25VNNYm8/6yAPu
 y8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686740; x=1762291540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buWf0Ypb6OYJRaVhj46HKhwljA+c0LfBLxaOuJMXUF4=;
 b=h2KYOv+hxnmc72TOwjDXFHhtvdu0crV7S/tMIrIBe6aA3Sm3DPFoUPCQDixggqj3Vw
 aOVOpGXDDexXiwpd1ufXTYEAZlClSKBR02jqMs3/DOSTW9eeo73k7ykHtdWIHFSjj3g7
 jU22EfiK/JQelc6Ddjd/L+npNSqL3MoXdBinIrujohGM33CIv0+CL18SHI0SQyyN67pZ
 XJWNLY7AouyZRbohgol1VuS09npltYA/UfK3JzGOFJgC9efpkduQ60Sd1SCsS+Q4sOga
 8GH67t0RoWdG+PJLX2wuuXqnwp5x6jv74pFsxxtVUDpbEQNwCciOdxtf1J1u0jnqf1uW
 Mnhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+eSYYRtLlPmlBafFNqa2ehpX8IpI3PqbQmwfQwlFjdW/uEbt7bg2MrDTqLMojc9YfQx5EsIOawg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzYvRMYGYDJKWJDVd75KXA+gA3gPs7o/98X5z+5/5qFLxKfxGd
 HUca57PiRpd0aNvAkFLpKSJs1twF33hb9VXaZA9gnhB2pZmzhI9/65LbsLI65Vcopl9Mk+w6II6
 9Ktle/YT7Ksn9LQJ+oywLqOK9/NUzcFVBG1kRfkJIMw2CxnPmjonoKUCUnn2PS1wrmyq9S3I=
X-Gm-Gg: ASbGncvtsO5Xv+HmmkXIore5pyRECUL18yeSp7HsTy/ClbjiCPpbi/7pX6z3BvbI4vy
 9OM7i/fsNH+Vu/HOrnBnf6vlmH/HYkK7LVBjOMfG3WOsIp5waK/B34+GwShu6T8YMktiWT2ZZ8w
 BJT9PPyP1FG1EO44rdJQPSJcz/XII0mdiRRHzFDwoqDD7G8sP/xNrQrfmugli+wk8mwQ8grydJz
 8ofVlB0i78bDSGeZJpplKRRkJfmMlMTc8i1MrGeva23IOWLjQsWDSl9zhpL1sgHneQIBSrJOH6W
 QDbmUS8dIeliapfwHUGkD9nmeDfomo5IcnrTUdosRUYsr6i2zxs02eF5BvyjDYDTCfmFBwIPXuZ
 8kdEfybgtsaotEXYrpjPc8Vb1Crr18rIC1zy2jj3MqRFF9I7cZ2lDUNkaTjDrlTcU0B1Z71OY7h
 tazNOLHK9NJNZ4
X-Received: by 2002:ac8:6909:0:b0:4e8:a560:d96b with SMTP id
 d75a77b69052e-4ed15c020b2mr10948411cf.41.1761686740425; 
 Tue, 28 Oct 2025 14:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO5pCJUeWKODo7AqcDXtB24CKjFMyBTZ3ZE99nuuxHRCx3zn3Hq6WfRARXUseSiFF6FSGTDQ==
X-Received: by 2002:ac8:6909:0:b0:4e8:a560:d96b with SMTP id
 d75a77b69052e-4ed15c020b2mr10948011cf.41.1761686739982; 
 Tue, 28 Oct 2025 14:25:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f8471csm3295318e87.106.2025.10.28.14.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:25:39 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:25:35 +0200
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
Subject: Re: [PATCH 3/6] drm/msm/dpu: Disable scaling for unsupported scaler
 types
Message-ID: <a56tw3xxxn5u54hs4pt64b5ljlp26x23lvftu2tblwpvuzx5xh@quyr7xyn7sn6>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX+oX6jtCukV2D
 J6AdkH0M9ZTCSUFR3DSXdCiqqP83FRK3QfCkP6IBKe7jmoNUkhku/Ngalw8z5KfBfgAk3SiTV63
 4w8G1aFOJn7SBGltU8jgqpouVelbn1W/84TmjzYPGhMoE5Lr3kYeIwErKBnSvIlZgDOUIkGiI6U
 u0plkalRchN4XgmDslkSvxhUcio2UZGH1k0hC9u7VShsr9qQRO1XwRF5GD7OgrAR7RmeIDBpUai
 Masa73PscSVDG2w5uJ3853b7+27aocQ7uLTmdk25W6qGAnzoZGOGGaziImmDxS0Jgmrvo3OpstQ
 fGE4hCg2MdcpDICp6dfNl+pvMWSLEB9e/JqzTF/swkXTEECZI4WR6l0q1dEOMy9t3tgljeIe6H0
 3F+Bl1x86RCJ+//Zv37y/3Zvsm+KrA==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=690134d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LqUZSzWJFxV8yDGbkgcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: al4C7CDOsWXZ2RNQ5UPwHDNcfn62-DS1
X-Proofpoint-ORIG-GUID: al4C7CDOsWXZ2RNQ5UPwHDNcfn62-DS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:37PM +0000, Vladimir Lypak wrote:
> Scaling is not implemented for some type of scalers (QSEED2 and RGB) but
> it was unintentionally re-enabled with change below. The remaining
> condition in dpu_plane_atomic_check_pipe is not enough because it only
> checks for length of scaler block (which is present). This patch adds a
> additional check for setup_scaler operation.

Nit: in future please refrain from using constructions like 'This patch
makes foo' (see Documentation/process/submitting-patches.rst).

For this patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Fixes: 8f15005783b8 ("drm/msm/dpu: move scaling limitations out of the hw_catalog")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
