Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05626CBA45F
	for <lists+freedreno@lfdr.de>; Sat, 13 Dec 2025 05:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE69110E944;
	Sat, 13 Dec 2025 04:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVC2IzOf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4khwkBR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD9C10E944
 for <freedreno@lists.freedesktop.org>; Sat, 13 Dec 2025 04:02:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BD3Z4an1907935
 for <freedreno@lists.freedesktop.org>; Sat, 13 Dec 2025 04:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=krIrLWAixu9t46zq8ZyDKkJP
 caIYHcMtAO/tuk3uLmE=; b=cVC2IzOf9nucZhnAr3gZ8t3dcvAFn+hYXis/U7wm
 RY0Bu3u1cUK+I/d2xctFSU4nlRmqjr1zcmztMyXZzxyd6o2NF61P4MvGJVmKcAmM
 90yQNRB4+FOGM6tdJpjv6xb5TP/SJPaSrok5S92KPVjUhFgg0C5RtTLj4TTPWCoE
 2vlU2WLGOqqvYCT9t3f4FtNCt5aRn66aszyIChZ9xwxysEj3+nXXfztJTjDMCH7p
 atU9TuChBUHpyw3CWhLL22YxdM94NHJbS/yHClETb7srwigtqqys3mSanmDP9MuC
 u++Mvr5SegvLGmHGHOOt1dvyBbuOjSFE4EyjBQi9SIJ8RQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b10byr0xu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 13 Dec 2025 04:02:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2194e266aso371330185a.3
 for <freedreno@lists.freedesktop.org>; Fri, 12 Dec 2025 20:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765598567; x=1766203367;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
 b=S4khwkBRcNQ8KGCvHgDOlNSX7d7qxgRHAnGRP1jYd1hDpNC7sMiQzHRKyeGdgTfw7O
 ED2h4e1ZFfwyN2kvtHxuSuXN/LBn+CiSF8vb1jokbvh0pP30ThbPEqIBbOr6vq4Vu1Lq
 8t2v4dSzb4RyRww/FrhI3IM6WqbbLYa5lvxqpU29s0SxA5GsIynvuSWGvG8p8/uuFC14
 RjIkCmKRqhMNIanPqQuq8Ckx5AiWwRObSMR6xLyuslKzUidivRdho7nhXBrNqIajVYF/
 LIG2NonUh6ANnVi6YZ63eUNVDU2j3COkw8VZjuPvABL7uEr7A/yRgvUC2OwAtmK6pTQP
 MetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765598567; x=1766203367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
 b=cCY9bQPPfcO9t/tKeq4ITz9QyMgKvNE+3Fp6qqaiksOY/1FaCl+jE/qde0wSMiC/nC
 mOkq/28VsQ84+oG13Da/dKoAimDpt16N7AgCecqbyAbyc9fTjZB8zCB3OGIvQEWPLyRg
 GY6KKLXWMdgTcB+ILJgBMVe0QMV0h7Qi1NwuAZ1vxq2Ja9reK61Dvw5UAnMF4Lf1+Wdp
 d+SRarbOOZOu1y2MxC+uDqNf6hXlflJRMAX8oyT8p1y33LmPZZFCyHGdxBIDCddJxo73
 3+83LfL02qgsAJdU3lwkmOhNw2NgweJqsBFAxSVKzic3dSkyRv9My5qO0mCUKrGWX09y
 yjjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8oSBgipv5KiB29MDi+Hxtprkqoztr3kfBd1JYM7m59T/Q8g+4t6/i9NK8hQoz4fl4eEW2k8Q1t6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYQyeQ3VllYdNjHhAFhD0JUCXyyPFJYCOwsBrbogqTS/Ju+JuF
 umX8XM7sUrmIQomfHlRpj4z0ymC9+VGuqkNpiTjJ5lQGKYFioXKvWgqYS4oJmDg+hjYNMYYjtwz
 wFWixg2txIYivDaAHSMqchB63tT0uzrPqUc1miDx0LgpAS+FkkPZPp56d4l8c82aYoyCBzlk=
X-Gm-Gg: AY/fxX53olWvJkCNNYzTJwnbMxOPA3lCXYy8iC/o5iEmkd0tMIbyZV7ZODuHllhcgil
 OqtKcfo9SYHeyjMyn1/iGA544YjOrUVv3XKJZDndVdinRqhRgCbz/InAIwA1Pa1glmbwrN9vbKF
 WqSeYSCWqGJRCaH9ZA0t4Odr+2OfI2krGN2vNcEXQevHoSG4g9d8WWT5D+7lUHbW7bvK8yJnRYj
 1NhsRpSukSAm7fDXJ9x19bhz0Ih0KdpThRCCotE/lMYLNaQDriZwx87q3NBXI5nT91dBe/AQ19Y
 SZ7+jnItS959eyMGN9fzMq8/myiigrgSgD18kV/Pu27Rw27NpPHooebJWrGvUQuTJYtH/HXcXUT
 0Gj0S1HihKARcvbDulGDBoWWJ3JqbO8aMNoWc8MrUT+zOXlM6VIP+owzKbgdlrE2nOD1OA1L/p/
 Tgxr6KoERFLmhnxv7dEZFPBx0=
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id
 d75a77b69052e-4f1d04df845mr58487791cf.19.1765598566540; 
 Fri, 12 Dec 2025 20:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc4ximOjQPXVj5aYQYKEhiuT3BE6BDth/OUUa2d+dNwwoMbOuQg7anTaVZtZI83QA+Bbx45Q==
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id
 d75a77b69052e-4f1d04df845mr58487511cf.19.1765598566091; 
 Fri, 12 Dec 2025 20:02:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2fa7fe0sm2582787e87.72.2025.12.12.20.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 20:02:44 -0800 (PST)
Date: Sat, 13 Dec 2025 06:02:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add NULL pointer check in
 dpu_crtc_duplicate_state()
Message-ID: <hl7op7zsxzmyttdjv2ijyutnobwjpl2fezaz7ohnlahzatui5y@677c4g676ekn>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
X-Authority-Analysis: v=2.4 cv=IoITsb/g c=1 sm=1 tr=0 ts=693ce567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=NGQ4gkOAZ6mTdP00BBYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: bPZ-GrtOCP-Imx7E9FiDJsvtYYF68_gE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfXxXLcULAvnaym
 WKWnxiqAHWXMzqdaDW1sSPKar8gUwUjT+M1QQqX2KhLgtZtZQxhS6JRh8DHAYuhFSqBkhYlXB4I
 TMpRfjh6MFKrOVwdPeM7e+kHLeaejkp+OxhYm6+YH3sPeZyvdd2O0WpaQ/TAhvV+LoRm3v6btbh
 jJ4clLl116dn5YsdVuXgd5ztKZA2XrKdQgkTXRNcP0m7opyIUg+jbOOXN8BO/ke3dwaVai6kk2K
 y6i+uPVMoMW82GJfqpxGBHxDazX6LUDKcOXkp5sxSGLhgzJt/9aOJbxDuN7G8lmZtp0VmfBp4jc
 9VdEbxQ57UKP4c008bjRnv9pJ4Gv5m8tx54vOtlKLS2p2UWpxzbaU73zIKBF5ksGTzUKmddeWv7
 v5Fa3nByu1YQtUZW5xUH05dAT5o5Yg==
X-Proofpoint-ORIG-GUID: bPZ-GrtOCP-Imx7E9FiDJsvtYYF68_gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130030
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

On Sat, Dec 13, 2025 at 12:08:16AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> dpu_crtc_duplicate_state() assumes that crtc->state is always valid,
> but under certain error or teardown paths it may be NULL, leading to
> a NULL-pointer dereference when calling to_dpu_crtc_state().
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c39f1908ea654..d03666e14d7de 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1114,7 +1114,12 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>   */
>  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
> -	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
> +	struct dpu_crtc_state *cstate, *old_cstate;
> +
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
> +	old_cstate = to_dpu_crtc_state(crtc->state);
>  
>  	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
>  	if (!cstate) {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
