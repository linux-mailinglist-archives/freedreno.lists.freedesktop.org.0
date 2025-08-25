Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151AB3489B
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B0910E267;
	Mon, 25 Aug 2025 17:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiMuOHWn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880A910E516
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:25:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8irfr023313
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+ihvTWrm11MUKAQSxwlSq5xe
 EvcCp7RJaL1CqX8wMzA=; b=aiMuOHWns1NJzoywgUneVEmQ2c/6snoKkNz4yiF9
 5t3/lof2GXO/P6yQZiNeI4wducHW/xmhUsLYkn95Ht5OhnXE4rDAEr2Gj65mxHAG
 883yvQRWi3U9gYL7ufyftSLgI1bVGj9iNaQ+3H2ERMaR80Kd8DKOrkj5IRMhICqm
 n1AB7NgSCx84781yh3TIRSTogsmsCLOwJZs6U0FuBJqY0PNofTHBJ+5Pts/WQF1D
 GspDON6x6r2fgaHrf9s0naumx0dyrdiNEIXi3eHKkivPtd9Ws9dCxpH5KIyjho2R
 vRHEMFKY9VrM5N346gkw7RjP+iofVStmRN9oHW+5F+7rrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5dtg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:25:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b134a9a179so48124691cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142754; x=1756747554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ihvTWrm11MUKAQSxwlSq5xeEvcCp7RJaL1CqX8wMzA=;
 b=fFa5wnWLJIG/g+3RmoeanUyC6sTG5tRwkRjrsigrT5kPdbKqoy+oYYRo6fawxMhn3U
 9rpORls2gAzOH39axhFwS8E3JPmUofc6q0i3l82egi4ESnfnOxQ0zyOxhiglIlZegwO/
 t/ameuOHpdKIfqnWcKZj2+PKsgOVmgdMFv65Sse3p+TmGaP9Ntf2tD51Lh+rKqz+ldwD
 tDEkKXxty7EUVj2xL0S9y8oKR1TJOs09UoeN6POZQRN4DbELvi490qozXrU38YJHXGAA
 AavNbdHKuwD5N85afJYZpxflUBVAiKkI3YYC/hT2XRhpw3PBj+OtQmWWQjlTlBqMCg+0
 VpgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFoMTg+3YTlPgI1/tYNVBgJhSGgVYaURGW0ldCStt7fS48OvkB3EJnfz0mxczuljn/CrDNDX3nk1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuQevdPdKtzZDUKd+nGp3ry8OIMTefKE0w93NVeEYnSMg4RMAh
 XNs/7elFAX9gdrryTxbOGCG9R0lrw0x2zsCDsAiKFSRlFsXLRTHUx2P0Fb+MalULYHAo1Ft8XL4
 sBk3/wOZ9Rt72oZ2+4rRqeAOjnyGOtNW+VqPBFm/s/HRglRW7oAPKt0yJnzsqcTT0PYzvKtc=
X-Gm-Gg: ASbGncsQXfhVyt7/8JTSm4u3lk/LGxv5XZkwoiEq6lIep55dpg7ekJpgrzdqILOCOiv
 b0DNJqveodZIorJx9Wea7R8obtX1wGUcm8X09gvo7AGcsg07A020CJKKNkGThOMYKKEEQctS2St
 o8W8A9gcqmbIlRNevo1i0dLZpJEb8c0sV8GTIHpPakd7+wWFRUwOrx6hA23t3CFfyGb18JuEo0d
 M+hbr25wMkHgArMnRqfXh1kkhWbaJP4DhueJTH6T8wT2J3TCxhwsaEkhD+C7ZFSbLfGAOQRREQ8
 oDOvxwhAqjPhJvyF7b4AoB/mlSLeZ/zkpHMU0IBe2GceKnDtiqzb54BtdirvJyxoeKK4ZrdzLBl
 HDPUpnpWMOlW91BeZWhC4tUEHB1/dTbHTABYflX7fOL7h0Mdpklwq
X-Received: by 2002:a05:622a:408:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b2aab20a5bmr188355491cf.38.1756142753397; 
 Mon, 25 Aug 2025 10:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaaJSnlDTCsOVk6vybE2eySYvDUVhffQEmr4Tj8nbzRC3viCjZnGQfkVbLytk3PKPOgFsSyw==
X-Received: by 2002:a05:622a:408:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b2aab20a5bmr188354841cf.38.1756142752721; 
 Mon, 25 Aug 2025 10:25:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca6713sm1738580e87.136.2025.08.25.10.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:25:51 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:25:50 +0300
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
Subject: Re: [PATCH v3 04/38] drm/msm/dp: re-arrange dp_display_disable()
 into functional parts
Message-ID: <gxhf3hexw3acfgfyyiarucrsjdhxqmctpoq4xxve2j2i3frime@ga6eqec3lrd6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4/qORbRHIf7o
 jkZnTWWf7lp//arnxen8lSLPna3Ygw3TBgK0+rKkh8rDJTc8WKrkH/e69/qgjrfUxK/a9vTgl/f
 4krPLMC1m1sHl90QR4nvWCx0O5PIZ8IRnK++j6ID/Xe0A/SK5LlIQLo3BTfYNfhZsblCX8Fl71W
 e8am7FgWPGTWNbo62Hh+6JZ+eZdfWl9RfTNWQEIJ+E7qd05sAWf3ldCiQxlZ1wR+FimCgrE+7fo
 r8UoYA9IqeQufv852a+HgxQsgg8eyy9xYAR8ichvk1MOuEIDvLF8k6wVSExqhL1a/Mxa55dC/9o
 2OtJsOb4xHBCZcP4xH9KYqOgnsm0jhw74Jv+fkqIIEtnKna5RL2GiTeEN4Bhe8xPgvEjayB6DqX
 IBqxxtAJ
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac9ca2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QFyoUhfU7BN0Y13r8iUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MlJroyGJ893w5MbgW4TSArX4AQlKKVLw
X-Proofpoint-ORIG-GUID: MlJroyGJ893w5MbgW4TSArX4AQlKKVLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
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

On Mon, Aug 25, 2025 at 10:15:50PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.

I'm mostly sure that this needs to be reworked by the HPD patchset (or
as a part of this patchset). The DP controller and the AUX channel needs
to be on for as long as there is a DPRX connected to the DP port. The
atomic_enable() / atomic_disable() callbacks should only be handling the
data lanes.

Nevertheless the patch on its own is correct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
>  3 files changed, 12 insertions(+), 20 deletions(-)
> 

-- 
With best wishes
Dmitry
