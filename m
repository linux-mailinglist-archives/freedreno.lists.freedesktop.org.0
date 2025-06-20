Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C060AE21D8
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 20:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B374A10EBAF;
	Fri, 20 Jun 2025 18:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQXY5r1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C497A10EBAB
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHbuj4023640
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PEdfT0ej6rioFoBNjA/itEoF2Clr7rfXta6Q0FyrT4M=; b=VgQXY5r1aAjjEPfH
 WVWWFdEEHuNKYDeUeNXocsal8slANzB9p4RiMYK6hAcaM1Fkh1j92aREBMTfX5xM
 7pPCe0wqcxxYUigGDMYyQSN5jRAoYa5ldGVIf/vDnyzHV9N1Q+jA5DGoz0xlocSF
 +06YExKrKhp8TDwqpWXWC1eWdqQjlBdYKvIwi/38g+V0NsJqBGqn4oseIAos6xuS
 FwOvPpumkPZeV53BK/PJlyUurCoZdTmNw5mSP+5ze6rnJk21+mlWiIyrowSJ20Cv
 j8O8OdLtt+uXxEzGsSMbryAsp+Pkpf07BQ3rlee7swU3wSFxk9AZ0ph6L982cxH3
 jg97iQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dc72r275-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d400a4d4f2so92900785a.3
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443242; x=1751048042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEdfT0ej6rioFoBNjA/itEoF2Clr7rfXta6Q0FyrT4M=;
 b=rzrOCpmZ+wh3j7/w/uNjhZUGEYp3PACQg9qxOybtd+KstvNUb+7fVtK7KZOYfVRNmB
 2pskHx0y5ETGY5txP4DMACGqsp+lTk/QJXb0jxiXzHITtCBfMu9EZKdcbPKSccKmgCfz
 4kQ1E2nJq3rJWKPIKpgILCyrPux1TV0rMWY7p449IhRUWZLUWWJlJUc58UQy50MPFCN4
 OpoSNyjQc5QDwE8CjYEucfS1tyRpNOzx3jitZB9N+iDhjizN2JzDwx8zDTPTASfNhY+p
 oCgqtvfip/7EIeCxYiPhzEEzpLIvfDwDu+YHju7mODWgkZR5NDq4jC6YcZz9IA35d4fg
 oPQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXitXmVbNxeUS7eJ1X9GT6S8ypaAE2Q1Bkpdc1vDRUz8VL8Wtjv35QliPYR7qsijH91oOEGs2z8VM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV67uzBFBaQn8QYRvCOFWB68T7pd6bKP6KmVZ+IuD4JbT1qSjC
 QSF2lyCzLddP0xE3n/O7kZkgOWYsrFGzh1Y+vQlqaQxL9hgazQv8m8ypsNPolpva5SzQeQXA6Ag
 vMjXoUazVnN4ksxzmdpwrwpiszjbVJWoO4DWalX/sag1YPAKnwmFjRwW+y6gtGOHeTxICAr8=
X-Gm-Gg: ASbGnct6cUaJHI4m782fOa5iL3/SyfyvyU8AH4eivm05aDNNk5rsiGm2RuZTIw6RPew
 IcF2Id6p71ky0twhosbcqZupVM321KufgW/f0Gw9aEl1CeUSZ8G8tgJ3065o2iaWdX9Iz0bmEuY
 mlkQzi3yb584XfXM/Awal1DFaCakWqgp9GVBc0Q/WtEhQ89B+Az1zjP6tOC3gH5v/OUrO4ERjNq
 CnRKXh+vLlGOy3iBuyxTb8z2yapHA16aWQstNuTdvD03VE2yx74tK53q9F8I4fqPS+2ii3jrgm/
 872hPnoajrsRErey3unnApHeusivb6wn4GybJFSRO9UevYJcSe/I32NGlqsIaRgglmzYVLvkGE6
 rXYw/TJ7LNcEJZFGxAwxIuhfZsp074mP1Fqo=
X-Received: by 2002:a05:620a:198d:b0:7ce:d352:668f with SMTP id
 af79cd13be357-7d3f993c19fmr609664885a.47.1750443242054; 
 Fri, 20 Jun 2025 11:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa1scLzEMTbwQtGcAzKMum3byZVIF6ahXfUCGXpgHDAwkBpTju7ydihEn+tbhWAI6tCDqAlg==
X-Received: by 2002:a05:620a:198d:b0:7ce:d352:668f with SMTP id
 af79cd13be357-7d3f993c19fmr609661385a.47.1750443241575; 
 Fri, 20 Jun 2025 11:14:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:13:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 00/11] drm/msm/dp: perform misc cleanups
Date: Fri, 20 Jun 2025 21:13:52 +0300
Message-Id: <175044313809.2014621.2079971726903686227.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GNgIEvNK c=1 sm=1 tr=0 ts=6855a4ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=DVdRDH6YNUG9iR60fqEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: zDlUb-WBy0rlhtlo7BvVON1Cfrj24pjD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX+pWUTB3niHTi
 1pQrjN+lpmDWyiQq/6K7SuG3laic2Y6bJp8OSQjUd01bBv6JhVuTK6S7WYNd5ntw4Y4fmOc4LEG
 JUgJLf7qrLS1m/JN3F2LAETfDv16WKjOLvM1iompYDT35NmQBv/OLW5KJO0ozXnW+UsIka42IdU
 6nCuxa3iJQfxqwHNOeljcOE99iTYZx55SBXajSLQqyvkbzDAS5AyDlfgR1tSPS7ik6wixGNuaWh
 Tf4aAqhlBWxTz3gYCckvKe40S8gSLdDaQoWJVQuYPEN9nENoi4Me9/b+qt2+j/VFg3PR0pFse2o
 sVHS/ejC3kinl+TrOHuI+JJBQaLzFAyna+7VQP7/Wvaq0oaOKUUssWvaSEFTiU8aEfo+Rd/4GgF
 hN0ce3fdJtzAMT+KQCODr6oaMJnpq4YrRDKH0ZnFayk5hHEjDvyWHFHjFbW8HvZWxpmZFEv0
X-Proofpoint-GUID: zDlUb-WBy0rlhtlo7BvVON1Cfrj24pjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=540 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200127
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


On Sun, 18 May 2025 14:21:33 +0300, Dmitry Baryshkov wrote:
> Rework most of the register programming functions to be local to the
> calling module rather than accessing everything through huge dp_catalog
> monster.
> 
> 

Applied, thanks!

[01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4ded343a67f0
[02/11] drm/msm/dp: read hw revision only once
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f12a3d46e2f0
[03/11] drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/df1a7ecda2ab
[04/11] drm/msm/dp: move I/O functions to global header
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e7957db17d91
[05/11] drm/msm/dp: move/inline AUX register functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/da5c957bdcb4
[06/11] drm/msm/dp: move/inline panel related functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b2ef0755ce6
[07/11] drm/msm/dp: move/inline audio related functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1324e395929c
[08/11] drm/msm/dp: move/inline ctrl register functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8583a655f2c2
[09/11] drm/msm/dp: move more AUX functions to dp_aux.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/078a56d3ee82
[10/11] drm/msm/dp: move interrupt handling to dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/609aa04d4f3c
[11/11] drm/msm/dp: drop the msm_dp_catalog module
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9d47325ee063

Best regards,
-- 
With best wishes
Dmitry

