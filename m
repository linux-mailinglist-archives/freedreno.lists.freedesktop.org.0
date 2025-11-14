Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64527C5D901
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6010EA90;
	Fri, 14 Nov 2025 14:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS7q16wn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/n+Izfa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D1510EA8E
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8Ttxt1435106
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=; b=dS7q16wnLd7iT/V3
 FisIduZEwA3xpsrWi//qFrErgYdFsdjFbfIOY7cT2h01IH3s9XWx3wkJCrDHgbic
 GMOy1KwH2nAfZ+KLvHJ+Zv05qsqIcexx1jIlUqEGLXhVzTfTpYIEh74cOPLNwm6V
 lBwkNj5IHf0pqlCHPqNNUShpR44cG3ynfS9KwmfMLOpoXDx4ePfcNWE6GI2WdMve
 x/R2E8X/KUhUKKew/ILD+K3tk4NBgy2FVIIsUcXb9A/zCCqlTFQ1txSpmJMEh3CJ
 l/easeOiKau6/hmjlfxYz2LZj3FOweDVg3xZUx6kOdzbRzdJq58UiGHiK8/sPlla
 z+KR2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g2dhs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e884663b25so50239211cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130399; x=1763735199;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=;
 b=N/n+Izfa6Fcz3g0TDYMIeW9pS6iLqHEEcmHR55Sgbx+zo2ehLVxel4rEo0Js4252dd
 3ioxZdwUvATLGsQLAF8O9HSPtezLxOJXpJrKpxp3ZAPznHv2YtvVrGluuwfRVylYy9kZ
 XTdDhMI94nB3vwe36EvPLxglgHkQSpjKMd9E8KJszrNiq45GCzjptaN1liMT+ezw38cC
 D4nMtFElURJD4rzR88UrmecEFZ/yW0HI3SX8BOSnIfDjJZ7b94kqMmaXqzZD2AiS9/e5
 dqq/tDYTsxSh9WZDNM3Cw4+OURUXQIm/rwEjKvPmj/Bat4ak5S3Hiu9HfSzrxEi5eSvQ
 UtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130399; x=1763735199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=;
 b=F9UB1wZIGX/qjr4wNCpjp35M23QyeOXdH3floAnJlkTqFDwquHmBdomQe1yxbsd/Td
 gmM+YU0HA87DP3aFXvnW0vF+kztmPgYiHOHuE3UzWo4nUZcjPwEefjYFvyx+oPeWOzvm
 ca+oXBot+S1vFAgXCGdFuPuC3VRis0WZr+otZ6IHXzmuVLql2T4529+RllaqdeM6IhU2
 UsPZO5aAkhP8a65nWn1Vp7f8vteaFpqclHUu1skrtIIcmw371lQ1a4ncpFu6+YeXeLOk
 o/U5iHphklY2NoILmDV69H7SHqneDxQOfd2kCK3DDk6+2FyFJIbyT+q8YK0lUNOdOdlr
 0Myw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV379xADoQhrCovtDR9Es3numvbFhtsCq+pqkpjRAhD1c4M1OwDlPCc9km6+PyxhUbvEsr+RQRZ+oc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcPMdzK2BSqZ868RAk/Ws+7CJ8j+aiGmp7Y/rA5xI0rOc9Bvq+
 cNuHiS/HgauDpTBOOb6BWZPDVa45C3IM68IZsBAoHyAPNytTG5jZIHIErvkvCpIGo4kqvJk6N/I
 MEBN2B6jUG9kmo3tsaXI1nF95wR9KEqa83Uc7EEfh9STHZ++GOqETl1lvHkb8tzfU0CMB9uA=
X-Gm-Gg: ASbGncuvLJy8+J1IdrjhJEe31aaryfHpK5yjnSdvcXkmBAKFDdce2H9AYqqGMVXaykR
 PMOIxz+VWEsuGWh3p+MkSNEO1yiMnHe2UDU2T6tMpUXZnOqc+vsqrqgTl3Ka8ZyQPoOm0kR8w/j
 RgVV80VTHJRmphujA77YzyHUy7FfFrTrJPO09VspOfXwJIgh9yaUCYWfLnes8m+/uC2lmWDzmXk
 N99ACqA5ydjSgCeA66PIMH8+xHsBBsBSKTrecZorUieBOiK7t+OHNKgCtK1HVmmhFshNoPUtP4U
 brO2QEKLNIODBgss4DuUsVvBm6Rh0FkBOsMxkAKpoakrvlvWjWGCg8fJuhB4QBAhgTF76avffvq
 FWc/et6E8z0mnUczbUM/qIS9wydy3mBCvTdAuFQ0+rvanPavXc+soD78bp0BN+Qwm0QcQIMGCCI
 jFKm7/e97QaQhs
X-Received: by 2002:a05:622a:1455:b0:4eb:7574:65f6 with SMTP id
 d75a77b69052e-4edf2064024mr47931801cf.7.1763130399348; 
 Fri, 14 Nov 2025 06:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1KBUfVirzD+NxHR8BcC6E12q6efxuXfJyY9Gp/GWoVvFTtMpU4YGPyfRbSGcbhMc1pkayfg==
X-Received: by 2002:a05:622a:1455:b0:4eb:7574:65f6 with SMTP id
 d75a77b69052e-4edf2064024mr47929971cf.7.1763130397390; 
 Fri, 14 Nov 2025 06:26:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Fri, 14 Nov 2025 16:26:30 +0200
Message-ID: <176312947285.1737000.3658283659221081352.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69173c20 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Gj-FGaxKOcyxjj5NLC0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX0Z5dnpnKjV7S
 LAegsJJruARATyK7AHw/eCF7rYjqx7CkcDBpy0V0MfLBoos+kH5dB9n9vKmmklWUGftV4oRfbPD
 s/I8j31OzCZy07g3lcaoVYrAHTLTv9vuiP7/cMsZ0zxsZD51UlRrSYpsqEyn54n6dtel9nYyVWb
 MO9jfw6wuDD+vr91w7UghNNvffEKk86JxKX6twyj3EtTeIzeooW2MBkpdmDNTKPrnTwQduzargD
 YS3ApGj6bhwH/v+7mft3wxBSOiwtOKUKbLheu4Mb4dWG2mxLj9L35jZ0dcqfXmV6g2K7IFw6qMP
 tTCfZgrNSkFiELJCx8Evw72fY1n64P2d0Gs1nwha4Lzl8l/mwCyuKm4zyJsOddd0GJrRI0QI/27
 O+W4uKGM6If0XfiQn4KZi7Z5FjD53A==
X-Proofpoint-ORIG-GUID: 3MT3F0tzbgM9k99C950Ve_J4gnMUNUfk
X-Proofpoint-GUID: 3MT3F0tzbgM9k99C950Ve_J4gnMUNUfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Thu, 18 Sep 2025 21:28:52 +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> [...]

Applied to msm-next, thanks!

[01/10] drm/msm/dpu: fix mixer number counter on allocation
        https://gitlab.freedesktop.org/lumag/msm/-/commit/74c4efe691e7
[02/10] drm/msm/dpu: bind correct pingpong for quad pipe
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e4f87fdd911e
[03/10] drm/msm/dpu: Add pipe as trace argument
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2c94547e0ced
[04/10] drm/msm/dpu: handle pipes as array
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fb4c972b638f
[05/10] drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d45171e262e
[06/10] drm/msm/dpu: Use dedicated WB number definition
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aed75641425c
[07/10] drm/msm/dpu: blend pipes per mixer pairs config
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c11684cce9e5
[08/10] drm/msm/dpu: support SSPP assignment for quad-pipe case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cf63d61337c3
[09/10] drm/msm/dpu: support plane splitting in quad-pipe case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5978864e34b6
[10/10] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd432dfed2ab

Best regards,
-- 
With best wishes
Dmitry


