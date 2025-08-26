Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06BB3727A
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 20:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A704C10E399;
	Tue, 26 Aug 2025 18:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eX0/HKGG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD72910E399
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 18:48:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QGGmKs019633
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 18:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xf6zh+YUIyDAnG5BFHyyQbBH
 caERXoO1mxLKUdCM3WQ=; b=eX0/HKGGC5ZnAJrPQniPN0S6qGHl9c/jtuHw4P5O
 VQXKS6cwWF9w+mK8UwyEOrORYR0V3AHbw0FIfl2H6U3zpQSYRpm3Uzf5izkvAQuM
 67rD7rqs8PdHFPhuI+i735wIC5McGEnTAcfg/wt10dLByjbywOn3sH6azGPpT6Kb
 ZTsulJ82Zz4s9YqcQpwTU8kH1bZTeV7wCipmjx3BdRaI99IU22r4eq8FuhubzluA
 fBXXHqUBWIrWVagz4hFeHmpRa6Rd3MeJnsrYqE1ALaIsEPX70szIpTPjtiO9Oe2X
 IjS/r/j+GXTujzVcW6TLuXn3kVCtr5NMHhzO42/Q7MUM3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5hvs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 18:47:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70ddd80d02fso2740756d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 11:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756234079; x=1756838879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xf6zh+YUIyDAnG5BFHyyQbBHcaERXoO1mxLKUdCM3WQ=;
 b=sk/SeeZqiiaEqrxks10hA5Ga8X3o16fPq7/IS7zInmlvBykbMygevo4wUH/UZ5ZjFH
 sIRJxtWmHRl/5xCOUWKCMIQf765L9u3jpRbzKPT/o3TZub2ks7Y/bg1xFVJ7bsKYd0A+
 p9SdLHrGqkJS0SBJ7L2Q0ZySTZKS5chXP1Fnmjk6lJSPrV1WXJsUj13M7rfwID5zm3/X
 /GYSCOa51f7p8B6oP9ZP+RL6PwuLb7172JgO/5ZnqG0nPDukOPPrWBNfzJGrpY7h3qIK
 /jyMVA8qjDvvqnzAkD6HohUf1S91bJJPArB3mJStxQPcJexNAirlbR8a4imFWXqQWdDP
 59NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWvTVGkMqCfNNhucndzGTb1ZFvxYdUAcYi0VDvKzGEX3M5wKaC1z+nfeiF449Y8bKbLTo8f8ipHZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyps73EvpCrM1tKY8oBMQt0JMA3kiWMmxXqT01xupTYNYkPNCOw
 vtOtbyq8ocvd0x8Kkmfh+jOwe/f5WC7nZJDLKVWhPbhzwp/bjchaH2pFkv5J4Mp6Zy1y/uMk5TH
 7bR0Q4yYal3+umK85WNtsvYwjgwVMGbHBpO+A7ngMq9kRrhzpJiJ6MsKuC/y3i8k7kUp2Wrs=
X-Gm-Gg: ASbGncvcitu8SA+ZFfsSTU2m75eviFRGllcR7e4/9mZuVe1II73ijSU7ObNSEDlfzCR
 Qx8olAbonuEjxTyDoN9NUOZmV5lD1SxYRj+ILZndfl+vrsgW+frNRJ9dvrBfc7OljFhqQc/1nhT
 tQeQhpXBxR+HZLvAoXb1Vpq6O7PahZDJKlu6GO9cqTrtCUiOl1iB9MOgLOuioZrx1+KHmDtvfKD
 LtuWD8iFG7JDIgP2ht3WWySsjNsSZmX+sIdkdFa/LTeeJEwmtn6YBsHIxxbuOdSy1hm2EvFxhhc
 vaaoh1voF8+4cqQqk2ZZ84khh2bOFd0uYEo65IqjHcbM5iG3GMNFUksKgIjg7OYhjGUcbEbibry
 yLwHc+z9RxhX9q095rhZTokH3hcFu73+SDQkjy3h6C5dePlWkPAbN
X-Received: by 2002:ad4:5d6a:0:b0:70d:95a9:6042 with SMTP id
 6a1803df08f44-70d972fa85dmr191563736d6.29.1756234078954; 
 Tue, 26 Aug 2025 11:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYYuUq+/6Jzw2suyCggISeUAr69+TeoIaztg68BBBhft9Bnl7W+AOYaJVGrHe3y/GTb8mo8g==
X-Received: by 2002:ad4:5d6a:0:b0:70d:95a9:6042 with SMTP id
 6a1803df08f44-70d972fa85dmr191563366d6.29.1756234078350; 
 Tue, 26 Aug 2025 11:47:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35cb5764sm2431932e87.164.2025.08.26.11.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:47:57 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:47:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 33/38] drm/msm: add support for MST non-blocking commits
Message-ID: <56tbubd46myozsycduvb5ds26smzosydr5fmbvmlv6yoiqt5wr@3ib5gnspxxqa>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8ffINXh2EVK4
 TW+S5cSpXwBBIDbOTPzuvDBR9zThOIRMe1tg6RazuyMDx2tlduxyK7L8iYNxpJ3EjcwyN3Kmy18
 Kw2RZV5r0DQr5yAND1WjVD3cxiR70ZNR1SKYC2OKNY8jqv9f+y3c6PR3498B36eyepMwN3+hzYi
 TmH399CM+lix4QWBKrA3iYQrT8rmBVeuuTJU+eJGOWmZRFEQdJe6EPQmq/6EH5O+3iix6AOPuv+
 weiMEoCsOprjZidF3Zpm/L/AAzzUqKQ5fT2TyRIgHK6d7vn8mFZvEnZ7Sosmccq4liR7IwU8+A2
 I2G2knG85ySGWS1jVbnEYVkZQuSxeE+4Z9sQMcDgouBHA2aL9MZ0geJJ3i8DLAB24fXSKQhx4Zr
 /PNBnvnB
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ae015f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=B68cQ6cBXuK3sqdErf8A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jJopy67KrG9gsp3kpVpBVRDRI-UOjqmj
X-Proofpoint-ORIG-GUID: jJopy67KrG9gsp3kpVpBVRDRI-UOjqmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:19PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Integrate MST framework APIs with atomic_commit_setup() and
> atomic_commit_tail() to support non-blocking atomic commits
> for DisplayPort MST.
> 
> This patch only applies to MST. For SST, non-blocking commits are
> already handled via commit_tail(), which internally calls
> drm_atomic_helper_wait_for_dependencies() in the DRM core.

I think this should be squashed into the the commit adding MST
atomic_check call.

Otherwise:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 3aa0020dec3a90b693ad3d4171cfcffc091aad4c..b1656fb456d54af11ba8a30d4971fface114c7a1 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> @@ -226,6 +227,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  
>  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>  
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
> +
>  	kms->funcs->enable_commit(kms);
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..09776be1d3d854f4c77d7df3afa8d56f53639411 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -10,6 +10,7 @@
>  #include <linux/sched/mm.h>
>  #include <uapi/linux/sched/types.h>
>  
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_vblank.h>
> @@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>  
>  static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  	.atomic_commit_tail = msm_atomic_commit_tail,
> +	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
>  };
>  
>  static irqreturn_t msm_irq(int irq, void *arg)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
