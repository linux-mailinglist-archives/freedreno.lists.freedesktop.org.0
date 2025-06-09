Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615BAD2143
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 16:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505E010E39E;
	Mon,  9 Jun 2025 14:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzHTThpB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1542A10E39E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 14:47:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994daD015186
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 14:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tuaiCNKngsyuTcrXO4lY5lHn
 ox8s7k7WOsTYEjpg4UY=; b=UzHTThpBROAclNP4kYRtw2hgs+cIFI+Ns8+D06xI
 2QX19W3nKhoQWqy+lhNiHpBbDVoMipsjLpj7usoMWLcn/0bAqXMpFwe9eY5TBaQU
 KSQd4Jk0NohfT5IJ96bEScFkG3ScRjuMv5WXw6swSMH1JGel7zcNYx/dx8pPnisD
 8Yw2EBWFUk8JptUvUjAYZfOd9v2DQig5RKZYtVsuKrXVMVh3/lM4Supzl3rmqVv4
 1pjbyp8o9HTOwPFt1rsrEGIAFoyCly13F+2ANap7BuQyle9gHh0RsiGJsuknGBaF
 zxyvCkn31MtVaCDx45FVe2yoVRYnFXpxXLexOQCmuG4M3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9ph0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 14:47:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c92425a8b1so706332685a.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 07:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480470; x=1750085270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuaiCNKngsyuTcrXO4lY5lHnox8s7k7WOsTYEjpg4UY=;
 b=m0gcav5TY4KfpFBgdp+t4qGjyNTBMrrsVcAuAQ1frEjNSH5VJsZ3/Rp4ciAsbjVkLy
 0jcKQ9dtenfl0Y1zjbv2Wh4nlLs89GQhPQmQLeImVaj0VlAbRhULvu/+JWHZnWiKi7vs
 BX/qZKiKmIwCClzdV8RF4pe9szfruN1gCfwKf8KaREZ9rh0PM7JqLdGK6j3cV/98kV7a
 IIEJ4RZFS80z5efLw3EPl46mRrIKCpefgu8+OHOmJN4IcD5Wl97NAqHxMi4uadTWzTNn
 B0MU4VDozHnExlWZg+95doB/EBzGHb5xbvtE4/M1htsgGNzDXYy2LBdgHQzyVVdtawY9
 HAMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUBsFTakK0wb/l92EcZD6DWWjoYVzZNcrlfpV+m5zKfObtyAkcQv0pQxVDYTBG5BGpOZJw3uThsZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnaoX/5uH8SBavN85JVirpXOAkKIRZ05yn6QDJx8+zgZcdlQrP
 ysvXqc9qeFbP1QJbwy0Kqkv47GTnnUtV8OV0kO8qFgvfj62S5nI+VgdwVzyab6pYDUxDG7DMoCk
 ZwyhW4iIpq3nHoir3PczjKWTDVoTo6+hhPEmy0U3yEFoY0zLYR63e3QIcuXwHFGkSM76GuKE=
X-Gm-Gg: ASbGncuEpoqRzlnOqGLrbaEXMt9p5idOl9VtWukw/6MjB5vatPNTwL8+XzG8nwvLfhB
 nsoMBTisS3ca7XGN17rkLiXcfPT4zGTErhZxcdKAtfj8JtWpML0Px1yvyQDH3wnAbzKxkFjVFtV
 oz6Lkcx16HD1Lwu/0Kgp3r1ajYD0GHw8EjsJ8U6+NPkgR30wQ599TvJ2vqbW15/MfbpCUF0z/D/
 Nm8Rr0KG+EmqfbVhYKl3t49OrOuXzESUUdKCU6/FI8jzGqqN2TXlglzPeXq+nJ5C6aKh4onvWrA
 FyWqh4prZ3fOYchKhJaGAacdDoXPxNZQH1VOm6QAch6eVn0WMhF8EAXxTgUvkQXOGWklZFm6miI
 m+6KxEZOE0Q==
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id
 af79cd13be357-7d39d155b1amr16769085a.19.1749480470640; 
 Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1IE11ont/nfDyhFTaWdajrMX3DfUNne8k9aK+3myxAzvAYnGnjtSxABOB2Bn0WlsuVIf9WQ==
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id
 af79cd13be357-7d39d155b1amr16765785a.19.1749480470260; 
 Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cab5c1sm11928561fa.54.2025.06.09.07.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:47:49 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:47:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <xx6v4lfd5cv24ce2kqtt7kverk36snydypeaq7h2hgjti5iadq@japcugke524t>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: rqJN_PY420tYW6bD4kF_94QQJlc2k3ie
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846f417 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=xwcYTDe4h3asnKb2uucA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rqJN_PY420tYW6bD4kF_94QQJlc2k3ie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfXwF8xnn7mLNs9
 ZXdkVwysX3HSpBxbTF04zfk5qm/balcGjGni0sD9uRDk2zgvg/wRX69fjKJ8iUQWx9of3HWaoeH
 8cq6SH0y87CQXz2Px1OkbHHVnCjMzXl6a1iix5TWepbw7VR/FbaSlkKelhOXpl7SMBhhOreHERi
 75PFYGoCO30HUXJw6w29t7jNj78cDQDMof7vlw1JtAE2rlPHAXMUutv/1Jo6z/hNZ2CT2RFLTeX
 CU/S6RhXiJSa4IIcS8S/0qcRQyq+4yvEVFEu2ofxzJJDj7gyBBRvVvv+VsSAbkbwHh+IY/G5xty
 s5I/Ieqwbuk8bayq/BGSvTvil+sxfzNtElCGIFwfcHWWR3DF5i9bIUlP9xbEnX95bv3a1cYgb+C
 SPik5fDYH5axOAjohLQlbehBGwxEUQjCTWqL5nOyg4efoOko0yHe8VIVbJcja8kIWpX8tVwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090108
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

On Mon, Jun 09, 2025 at 08:21:57PM +0800, Yongxing Mou wrote:
> This change enables support for Multi-Stream Transport (MST), allowing
> each controller to handle up to two DisplayPort streams. As all
> necessary code for MST support was already implemented in the previous
> series of patches.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 75f2fd7c75eae81e5c843f8ae2d1ce12ad0cad7e..16196dcc9ff4ac6a35b6bcd8d433b08f7d18fe5b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -127,8 +127,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},

I thought few patches ago you wrote that this controller should support
4 MST streams.

> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
