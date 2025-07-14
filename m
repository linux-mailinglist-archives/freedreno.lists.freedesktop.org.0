Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44885B03E8B
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 14:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0BD10E0F3;
	Mon, 14 Jul 2025 12:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnXUyW99";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B0910E0F3
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:25:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E66TvX001165
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Uvgo2/+G21cKg9t2+XS0pBef
 4DAQ2zGn/cwQ2SSIW/c=; b=cnXUyW99VBlIQ99FaT+/YXZ9BhGRL0zpME5JqxPw
 VfVy+mbrMTnT3GlTA9fRcrQ246XJPuTcWYYXQ2+7+Ifixv3vUKWAE0YD0NrZLwdA
 BMHTn5DIDLpY73Hno2GKnSQb2DfJvEi6skVb0AllVUbWSar4CvpMBg3iVikqTQhU
 7NNwiVwnxK2vYHXL7Omo2kwCL6X1TcxkfyrifhNYX7WtBfg/e/6ahke/4o4shYHR
 WUv61qGy4MahiGBVcYt0i+YKp6PdKCrJGQpS/ZW5FzGe6CnkXHWvvnaTkydfcM6e
 +zpREAl00uSUl5Glx/hJ7R8vBs013h4DebuywIk29qan4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay184q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:25:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e333fae758so53051085a.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 05:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752495937; x=1753100737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uvgo2/+G21cKg9t2+XS0pBef4DAQ2zGn/cwQ2SSIW/c=;
 b=dVFxlAzSpS6IQ1wp2KfWxVJ60dC7+AAJ4iUyQoy9iNqvKRLj4jTXhvADMkHxeg8LdJ
 3jl/m9HkEKksOCTWhoGKWd7/EUovSkKC3t0UnhIk8tFxJNgLA3xhLejY62NjMdafVil2
 8HVuVQREDSEBfx109w9rHgfhKC9wOqjt+yy8IfiMt5SrlOaRZPXIB4wfIH6eesp16Y7V
 TNT8kDQNQwB7aERV9E0EZ5Lrf5DLRPXVpTZkPTxDxH77IOQzIDyTyHxflkgKzO8rT8g9
 yJMLg5cRR/cz6s2km8cNZkXQwOYn1xD2Gyc+oKUOGnVgXgQmU0LPcrJl80Gme4wQQ/4l
 Owsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYyTRjx8Yys/eON2JVp4MRJnLWu6H6ddzdtegU2LRJfIPIC8BOhO00j1P4n1XNPspauZ+SgLP6/Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJLJ3VBpmJUkdlY5/dAxAelvNbZN6BVM+Vk1AmoQ1jPpXSNnX6
 XTBGwuXwcK9sOKLtrSaqi/ZJ0281t8j4JDzMX8TjeqisLC2xduFR5/vc+8/R/XNPzjkLtJ1dadG
 DhSG37Blb5TQXuej3nxiC3I9hEK3b8VK8CMDEBdOWYLj/pxcVZi0+hK7HqLSk/63aiAkinaY=
X-Gm-Gg: ASbGncvq5D7elUbp1MNvJZm4Hj+L3uf31LG9FAnoKL9UWffpwDxwSSKLZpA2jHor2mq
 jWnymV1xu9NFVRRW5dBqoTMKSe/osaTF1EN9yb8Pdl7PtjCy6YRNhpYbbUN4PPjPGyOa8nZGfwr
 RnqvYEpxx1z08ar8uB3NSV6hf+Nir806la50xkWm90cyYOigaMPsdZC2WIfoyesPpFtK7M68pDD
 JIYURAFwbjJsMUKvngcWY9GjCRshcwpEp+Dyl5jd35XpQ0yg7BqO1aG+rCz8sau/cGlhMTUAGXI
 qGXYTy3InzBLesHwMWZdJuoSnGgiXgZl+SKLf7wYPl8wkjjxj1SwyCja07GI1TU93I/hkg2lVhE
 lfDUntnPg80ZJi72L94A1e4S8ZB4BmOKkMQO+T9aRPmhQc+oRoaom
X-Received: by 2002:a05:620a:4405:b0:7e3:2c14:231f with SMTP id
 af79cd13be357-7e32c142744mr378809385a.43.1752495937096; 
 Mon, 14 Jul 2025 05:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcd4HKe+PFCgEHZG7nrqRuYfVDMqnxe5piG1IIkUMCsKQIHLQIbL1N5PpU+BI2Xdue/UzvsQ==
X-Received: by 2002:a05:620a:4405:b0:7e3:2c14:231f with SMTP id
 af79cd13be357-7e32c142744mr378802985a.43.1752495936409; 
 Mon, 14 Jul 2025 05:25:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b7ba23sm1941079e87.238.2025.07.14.05.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:25:35 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:25:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 17/19] drm/msm/dp: Use drm_bridge_hpd_notify()
Message-ID: <yd3myqnh3lbaafckdevn5mv2bvrobpisodocmwj5ngnntd3c7g@pixnwcdjbecl>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-17-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-17-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-GUID: gk5dgRwDAv4sUqB5ccmLfLaqXvCJJv2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MyBTYWx0ZWRfX7Zam49dOtudp
 Ij5kDST1Cv8l44s/FH8TdBbxeAyrg7oIwkfG7EY1SErimf+oQh9sk+/eh0pEdBnYQ21o1iqOG04
 XL3p0+nLrV1UcOIexkSq1omIViCddAAk5oMgS7KqN12GyKi5Yw+syLGhddwpBKDZW8J4q4i7PpW
 WsiU85eAJGcIcqKnAi/yCPgfteR2uCGcnjPkyOeWgAn31oXq1IVMu9nwligag50xXXC4Cx02Tos
 IjLBkOOcVaik3T1ry717L2slh0D6lb7Jhlhd7wxWyf9Yxw92gKoyc4kMshevkQTDM5ZTDt98qpf
 xw+oYDeN8dbJls2XPUKxnzARy41VxnLJ8mRrDtvlJGu3LFpuSb7Z6QpiTVYbflblEsA7tzGZsWL
 jZ8nSPDtT8TgUlWn9iVu9I/gk8WQW36bgtj6A0JyghP2zFzkJoPTupf7oG3+wVFltpGreKw3
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=6874f742 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=POgxf3QGRWwV6KP900oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: gk5dgRwDAv4sUqB5ccmLfLaqXvCJJv2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140073
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

On Fri, Jul 11, 2025 at 05:58:22PM -0700, Jessica Zhang wrote:
> Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
> way, we can directly call hpd_notify() via the bridge connector.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 8 insertions(+), 12 deletions(-)

This patch has some issues. Beforehand we were just stating that there
was a HPD event, now we are explicitly stating the status. This might
confuse DRM's status handling if the status here and status at the
.detect() differ.

In my opinion, this should become patch #4 in the series (connected,
link_training, EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT, then this one).

And the correct way would be to call drm_bridge_hpd_notify(bridge,
msm_dp_display_detect()) from the IRQ thread. This way we should also be
able to drop EV_USER_NOTIFICATION from all over the place.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3aaa603da4f9..87f2750a99ca 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -324,17 +324,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
>  	.unbind = msm_dp_display_unbind,
>  };
>  
> -static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
> -{
> -	struct msm_dp_display_private *dp;
> -	struct drm_connector *connector;
> -
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> -
> -	connector = dp->msm_dp_display.connector;
> -	drm_helper_hpd_irq_event(connector->dev);
> -}
> -
>  static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -358,7 +347,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> -	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
> +
> +	if (hpd)
> +		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_connected);
> +	else
> +		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_disconnected);

drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
		      hpd ?
		      connector_status_connected : 
		      connector_status_disconnected);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 68bd8be19463..6e12694d5a64 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	struct drm_bridge *bridge;
>  	bool connected;
>  	bool link_ready;
>  	bool audio_enabled;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index f222d7ccaa88..b12a43499c54 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -358,6 +358,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		}
>  	}
>  
> +	msm_dp_display->bridge = bridge;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
