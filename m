Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E878B347C0
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 18:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EA310E503;
	Mon, 25 Aug 2025 16:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="akle5lkg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE17B10E506
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 16:41:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFfGgF005924
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 16:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SUGCf9gEHaW+/RTV5UaZ+1IU
 xig0tsOVObr1R4RU2Ng=; b=akle5lkgTZUlRBiVnK9XxhwYCRubrlWxOlrEJ/mX
 OQ7/6CcPvMNaMI8YTkJ1CqXLfPgt3IPndshefkiw9uwn0ziYaYT+SldvtDd1cOUA
 9pacxNvbwstkKzSOynEBlLVXVCUH3U+XPhWYY3IKpWd7Isib7f/ns20AXDMlGjt4
 hyS2+6Eb5Xjm+9NwLXWTPxEObQO6nmyoyRiCQKjJhFhiNvkpwLAlYlCe/vDDi8Wx
 xzB3EJuUMRo1TvUah+6iIetAHIn5CqcwTlli/mdFlJaRrOG5hFhc+ddZZ4jxdfcA
 srQsgiZ35HgnYat8bQL6GUuR+yR2QOS4JNdbgbLRKnDY7A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtper6gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 16:41:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70daf13cd03so37830936d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756140072; x=1756744872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUGCf9gEHaW+/RTV5UaZ+1IUxig0tsOVObr1R4RU2Ng=;
 b=qXnIISN7+Tzbs+d9zvBcwM+S4xcgCcm5G9UiWYLOsQ4Z6KZB5nLeAOm5GE+3dCRwvC
 t84Jwzu3ObIHBZzzcBHDInivTT696o8ZnAUddp3VqwSd4rvJtuL2xIexoWpEtHgzgHhr
 fpJ/g2JcsfwZvAUgvfCAUuqqJpLxtXpKUxfPXZvczlPedgfIRiIAbgeoPYX/8rXbBHUS
 ByVDzaJ0g1PbfAKQVJydaW6v00C91KHTC+q58wBVLdircqOMeUsedb6/IqlRy3YYGf2o
 cNG/izyV+6wwYhX7FO+wqTjZXrnsOXYiJ7fNvaSr23DaCqm8n6bti1nDYbGxwJ5rQJlE
 HA0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw/qYW+t1mAqAx9NXAfBLkx1BjQxF5fzOzsV1MFOairhaoKN/WX0ZbIb+XrCw1eMMHND0tJA7iZWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysl4HzMjCKunXMdJKXi3blrbYZ4UN7VJCwr65fNCOyzr1A/Zem
 Skd0esn6gl6eYBTMdy1zECPpAkYJOwXq/n+y77Bzjh9W/Y1ZUq/shgfmkmXWtyVy43TV/xL5DYw
 LI9gt5cJg5LmeI1USM5ps0J+dtg4RYd3SE4UFrCU0H8VaG2uMr8Gtu7pf+IWpTTn3a3rIEpE=
X-Gm-Gg: ASbGncspVD37H6alEF+m1oJZV1ckUwN6VR4OA1qv53uWRo1U/2CmWyd8iHB2sY6D06d
 iijFBO1LF3mfB1X1CvJbwxikWygGzNLyEzKdz9zswhNFJyJOAa8S4AdyOvV2/HhnPa75nfZ3kxt
 qtV4jClFtahmCfylZoajjQwZIQHgLvSb4D63yoZD45AXrb4gv5KNk1UP5ZoVCzlAhxsfApGJKQN
 On66FA0O81tSEyIdS36EUCBbNkzAkKAHoHAeptcf37Y/GNpT3bag7rB5zoJ29yJsRx3OReAUiIG
 fCg1ARllRLiY+Jv26RGz1NLh2MNtoFhTipbRrl9qQ29gc4/fX08LR8WTcZavIwT7h8ujF5z0nAi
 zM+HF02kMJ0OtcZ1NbeLNYFceysoGJioJuPu0v+2dTj6zJhm3VmlW
X-Received: by 2002:ac8:5905:0:b0:4b2:8ac4:ef56 with SMTP id
 d75a77b69052e-4b2aab43ab8mr130527841cf.77.1756140071863; 
 Mon, 25 Aug 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoqs6K3ZpqTkzcj7pYumPFvNMUPXYlClvXN3ij8BDNr9VUaeeMGuXTmsI96ga3TCHPX3H3WA==
X-Received: by 2002:ac8:5905:0:b0:4b2:8ac4:ef56 with SMTP id
 d75a77b69052e-4b2aab43ab8mr130527481cf.77.1756140071290; 
 Mon, 25 Aug 2025 09:41:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c0221dsm1672404e87.7.2025.08.25.09.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 09:41:10 -0700 (PDT)
Date: Mon, 25 Aug 2025 19:41:08 +0300
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: 7TJfUN4cGArts930aS28NVLqW1Q1HmZ0
X-Proofpoint-ORIG-GUID: 7TJfUN4cGArts930aS28NVLqW1Q1HmZ0
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ac9229 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Xi5Nwd9LVAJm5hmD8FAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX+jeCY9XDa21G
 2SbcsYctmLRcX7wdZMMX+ImUpePuEBBP/dnF4xYMUoIoJp31bwJ5rfdoOu87m0xvnWW9Xo6p3GT
 NTkxHmPytUakGtWvo5UgfY4kGC9OmcMxnl2hp6YjcIcSdTgN+cjhEuh0oPWZ1usz/ikXhOLDafj
 MJuHaR5LPsDet7D1Cvn4LMGMODcSQI1woJCCEJKkCAa+s7jo+rcBRy0vP/+IT8lT2sbWtc+hYaz
 bx4vSagGh4/DTqtYkrE72rYu63rC097VVI7w36HofPm3YfeC8rA2n4oznmNZVmqQsw6WQBWRybA
 nDz2Xq9fRQXFcAS2Bikedlmoh3eumD+MHJut7SHDqxZOFI2KcScM+dzDBgrfM5WeAP9aU79CvMU
 MI9l2lL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
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

On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> state management complexity. This change removes the drm_edid member from

Please see Documentation/process/submitting-patches.rst on how to write
commit messages. Please use imperative language instead of describing
the changes.

THe patch LGTM.

> the panel structure and refactors related functions to use locally read
> EDID data instead.
> 
> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> - Cleans up unused drm_edid_free() calls
> 
> This simplifies EDID handling and avoids stale data issues.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>  3 files changed, 26 insertions(+), 58 deletions(-)
> 

-- 
With best wishes
Dmitry
