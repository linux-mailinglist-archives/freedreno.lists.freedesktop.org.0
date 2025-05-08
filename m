Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3400AAF854
	for <lists+freedreno@lfdr.de>; Thu,  8 May 2025 12:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8A710E37A;
	Thu,  8 May 2025 10:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv/Kb+64";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D656E10E36B
 for <freedreno@lists.freedesktop.org>; Thu,  8 May 2025 10:47:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484XJHa009505
 for <freedreno@lists.freedesktop.org>; Thu, 8 May 2025 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DJLcczpvmaxUKxKji1M3aDjS
 LMp22wqvdaaWQcNcABU=; b=Gv/Kb+648EnqCkbT8oiSS/nnHx4/i6ee1pUgaNmQ
 FnUjCk/UAGVjGYH+VGq/D25g+DQq0qKGlcFyPwANejgQf8y2UpnO8/UgdIKBKLS1
 aNytjGviDAntLa98J128KzbAgX0nDDcuJKdVacTi4UbTMa+c9gYx8ac6c43JnapP
 KozT/27PhRry8eHLRrBG2B90VDf1lG0SvYLz2qY+R8mAQBuFFBu/Uhoxlh20tF3s
 dWlzP2EdfoLOwoF7dLiuIQM/wLZ51WSrniBRSogGH/tKt3XWmyTbJOAaocLoJYIt
 NwWM4ZCfcXW1BbLRm//hlmW5SyCgvTk2Pu2lMwPzxU+VdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpes09k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 May 2025 10:47:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so143539785a.3
 for <freedreno@lists.freedesktop.org>; Thu, 08 May 2025 03:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746701251; x=1747306051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJLcczpvmaxUKxKji1M3aDjSLMp22wqvdaaWQcNcABU=;
 b=SuPA3DzSzPpgjmAQFMlxytNULbJN/zfYnGJA38Ji9MbcMq3WO1MlBxH7IaYO5Ibsh7
 nkjjar8AUshdhkhvABkudwaWzx1s7+mLQLxQbbea9T2zhh7VaLU/i/nrDExEWc5BMLvZ
 kzZy+egsOuryx451y789xOJCcyMZsmQLQr101v3Ldps3mX9KjmSLE8EL7ClbzKTuSQsi
 QCOBrZZQbw7OCl1lRTe2OTdguNmU1iPqtt4yZq6aaxm75QhVdE7dQOH1Fbb9x28zjHEJ
 KB4ebXjiAazL49zqC+on4pcOTNzVPCozFJ/uLkVaAsVvKQ1ZT6cz2KUxOgYuMhMCee7J
 UHLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMPIvcoU5iYW2gr1WKinYYTw1wFWy1Vgj1TTyWtTGfpq7RRR6LDoJzIQ2KN3Db5wqzp8xGccG0ZjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrPwn/dQs1zzGt72H/eZrPvRTfYzWimAgA6MLXVVC8PoV0vfzh
 aOxS631KRInqq6Gq0iUduoiadthzLl2eUXndGg0gYNbA6eeigvmBE8oZJ0nlScletaYsULcF1dq
 86VLgPqZlPR9bhJPHI1c45hvXnRHTM/PMRNpAiMclC0V7Jw4t4rCuFKDWpZut0Hv4Dxg=
X-Gm-Gg: ASbGncu1aePbndd2TNMXcjJSoYOKVIL6B7To1AVnilenDCCNAFedRCm8pfdVVrU3p7a
 mlNq7UpmRY8M0+3C+CUO2s3W3Yo49Mf2Wxq1XTqe+53nZcUErdnCIgzQaWAqmP/u765kdrV1cP7
 wNNqmQNvl86xXIsHMOBwhk4kSJCjnE8wkbY5V2ebxmS+xGIcPtKideeDX7oNkL8RIS80OZ1El09
 gzlLudFY90R5tn2zd1RbR5GtcuMMuGzSo2CoHepA8XfK9LSvQI9JFDHrmNo8VWC5Smo163AEh2z
 CvsP8DvKS2gpwTZiR/lTterHrhnFbSAZcl+jKnWFTFtrMLyJl5zWaQ0TVcuQW0YaipiptO9Csek
 =
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6f5429e1f20mr112740456d6.7.1746701251154; 
 Thu, 08 May 2025 03:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHl4JUcuFrO/9rVeQzXi9JZCdORJB3CJB1i85DoLPVXTX/Y5q6n8b+WwBx6so7vshDBnZtiA==
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6f5429e1f20mr112740036d6.7.1746701250806; 
 Thu, 08 May 2025 03:47:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f21a8sm2573813e87.197.2025.05.08.03.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 03:47:29 -0700 (PDT)
Date: Thu, 8 May 2025 13:47:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
Message-ID: <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MyBTYWx0ZWRfX7aYhtJEonVVw
 kVmYT9x9RsQn1/+uDIWr2EBW087j13Ds4UU+U8hlDFqhji44Qs5kf8UDBkF6rl8WyDNLO0pTjD8
 GRSzEZWaQC9JseRw6ZGbKtua3XcVEPZu8ZuKTvzgdgx2bFHN/ADDRvHgeZkYExV4StwlyE/Dpd8
 9D6PX6DpRtnZGCrJsaVgzc3gIAK15dREmVOS/yoF0ycNwZ0/OhM2RDrdTnoMIZRosfQFlCnvMSG
 OXZMh34CJBQ1xaJxY12jRo30NL0iLhYHDRBKi5dmZPVArfcdy3wX5Gd4YLk4u/+DQHppoZ5ALo0
 fTes6yuNUVAkNhS1QxjR15Lw9V7IieOAZSboGxVoG9e+ONyhkOMxDmKiJK9+Fod+BOzbfmTb8Vf
 Z4ge6gWiwhMl7PZG7P0jIsEerxrEW/ZevUBmW4hPNxxRkcj/7QjF5V4eaNzeYjLkLwKPy84S
X-Proofpoint-ORIG-GUID: bS6KnAJV5LLLSothitbyf9iVXbtrYROI
X-Proofpoint-GUID: bS6KnAJV5LLLSothitbyf9iVXbtrYROI
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681c8bc4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EgBjQOAtpNY6-goZWe0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080093
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

On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
> Some display controller support flexible CRTC and DMA, such as the display
> controllers in snapdragon SoCs. CRTC can be implemented with several mixers
> in parallel, and plane fetching can be implemented with several DMA under
> umberala of a virtual drm plane.
> 
> The mixer number is decided per panel resolution and clock rate constrain
> first, which happens in CRTC side. Then plane is split per mixer number
> and configure DMA accordingly.

Here you are describing a behaviour of one particular driver as a reason
to change the framework.

> 
> To support such forthcoming usage case, CRTC checking shall happen before
> checking plane. Add the checking in the drm_atomic_helper_check_modeset().

So, now drivers will get two calls to atomic_check(), one coming in
circumstances which were not expected by the drivers before. Are you
sure that this won't break anything?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			return ret;
>  	}
>  
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		const struct drm_crtc_helper_funcs *funcs;
> +
> +		funcs = crtc->helper_private;
> +
> +		if (!funcs || !funcs->atomic_check)
> +			continue;
> +
> +		ret = funcs->atomic_check(crtc, state);
> +		if (ret) {
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] atomic driver check failed\n",
> +				       crtc->base.id, crtc->name);
> +			return ret;
> +		}
> +	}
> +
> +
> +

Too many empty lines. But the main quesiton is: why are you calling it
before mode_valid()? According to your description a better place would
be in drm_atomic_helper_check_planes().

>  	ret = mode_valid(state);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
