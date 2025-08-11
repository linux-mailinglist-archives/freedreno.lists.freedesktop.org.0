Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F75B2057C
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265BD10E42C;
	Mon, 11 Aug 2025 10:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDV5h0nd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3800F10E435
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGqb6024522
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=lDV5h0ndMZZUeAuz
 0IysO8UnRQboBN6aqIGD9Jg9X3+MijLbMAA+Uab6Nf7FA82Jv8fXiU+QRYyzzXTY
 MpsLtYG7yHFlGthLlH+RamQCEAmEXi/n9212GiRtUqe08WkkXHf31r8mfulJqSIH
 hTmRm5xTc8JmaG8LynS4/k73FpXTWEkJVBI5s6YmNlVFYVMS42nydyWej9nG1eQO
 yS6g3wRIZs+UiPdwvBS2gad/iNpqa8sQ+nORwYYqurup35SULgLo3vfwICoO3EO1
 yFP6OaBQ4C8f2hbrbohrj13gelABMRCrN9BuQ3FT6j7hlaLWtmD7FVZlZNfLttQU
 S1enwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem481bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b0938f0dabso11449751cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908432; x=1755513232;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=VMF9oCefDlm8O1KWYmJEzHwt+gnXicqc+Wm6+Dj26eMaFpWLcrMc3TJNcOZl7MVyY7
 KC4cJtgFnj47XNoGGon8rvxuyV6xoQY9n/kBniDIuNnK8xjsWEdd9jE2tYjkoKQXq+XL
 LwQDeW3j6DuDIxjgNfbx4ncIALEfGGCvbpEN+eTPQZKqGYyl27sCIcMFYviGbxiNm7uI
 3LgGGzFKhBk9rlvQ4oaZIiRBnVyLOPj4w9mbBehWqWitCUvEgbaNbMlFTpMZG4HQMeJL
 XHrbdypqg4gxuQ3xxD9z4yltfx8+gcU+8K72BHIy2je2Ps9elx6Bji+dQsvPHxq0qfPF
 XF+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0BdGnZYabhNQPo1R62XIxOiuTk2l8+KtzdayaqbXdEQOtnTBIN4a0hFFvlbygf0FZ9XmUrup8+mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBW8RYczqNaz9hxgiby+UnjVdvr0qBOSO1NOk8WfGnydBVU7NW
 nLvLc0ZWfK3v/aJCO4dPykxmHX8almEyyvmgGMO+r5EFQU22nkGXdbTWu6xIZWqmF8EmepWr9aG
 SuXCNDLFDr2FFkfBHj5vbpBGXK1Hx14fLqEjW9i+5KM2vFXmHp/u1mXj4yp4o4pEfQqbHKnE=
X-Gm-Gg: ASbGncuiTqF57D0eNwiausQN4Ump1/jGnuy4mKwEs9Hsx1N9b9Tz1SW1Q8RMqPLWHc1
 0YRrhtRQvF1H4fRa9PcX0xCwPICifF8Ifts8o2BCfKX7KFGMiyv69vGAVcIwTjXoJoZQ7EHJK16
 ocAlCj3zYOWc9qWZdojbNhU0rGBwAlATctLFmWPdZ8P/y/Cv3fu2r8lG81ebUyDuPT+BRKzn5TA
 vkYI9j/oMSNjNXlL+VPOkC9mICdJYGbFyFwEl8MrLQFHTT/iXilIPPD9jBnDC7Hbfi0IbZoP+Hj
 17hoJxnO1mUIMZ7dS8XR5n9YuQi51K57GSyZip5Ow1+uM6tU5B/d/qRZY3XTCGYGR97NvHQ07sG
 uuMJePswPixfJsQIYeA==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id
 d75a77b69052e-4b0c16c4306mr54913931cf.0.1754908432540; 
 Mon, 11 Aug 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFWzMOx5lf2Y5IZtNHNRwVFoW5v7W5IA4jlN1pRSARbMIRwDiUHjzbS30nEqXIzqvbxbYx1Q==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id
 d75a77b69052e-4b0c16c4306mr54913671cf.0.1754908431941; 
 Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Message-ID: <2a74d3d1-62ed-4a5f-823c-e1ca376ba104@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KFJAFD_Yuqf7nnNSeCwRTHGp7upDj3w9
X-Proofpoint-ORIG-GUID: KFJAFD_Yuqf7nnNSeCwRTHGp7upDj3w9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX09aCKjaizmJX
 zqGPSzGLGEArVHi7MLMnTME/UrL7boPzXIynPumiIOygCgDXXFUHH9UHy/kvTeAq6e9UNqHAf33
 o9y4hvTSRgkKEaHyDyJnBIuFRfAAB6MCGSBxGgqwtbsJ8JAt1ygGoLmn/K9LoPJNMggSzUQ+Fk/
 Tr9q4bUpIKHiwtbvEWzsB6j92ESyzswYAZHM0jPlbPh9vYkoukudKMK0RRtk3d5aEBX4Cs9CJGs
 lqjHj6pvXxfidR0WCyfBOW2KtSFa5bN4YMvpWM8PfyeN60iKpy+AdXLicdySPjrc2cBvJXgueg/
 MuoXmu+Q6wfbWeysliSuL+FdOdhUvy/dz94wtVKf0+oPW70HFW7TBM5lK7JbJoeh3eS+bo0B7XA
 0C210GYw
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c711 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
