Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A763CB20582
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818BB10E42C;
	Mon, 11 Aug 2025 10:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="muJKlt2Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3D910E42C
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:34:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dCb6021586
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=muJKlt2QHD30b0PW
 KCf4MMfDmKz/Chb2p8V2b1lzpymdYwgT5IafpJ8GsAtII2dqKbGBQ2V75pI5FEuA
 6gTh7QPlryeJRU5t1F0EDOoeZnG0+tsbNzZlrfbzoioXA3mBaHW49S/lSgCfqRFo
 9d3ac/8ptkZ4+Bfdr4OMEb81n3U+eyKPRYj2BvyF77YDfIJ9DowsHzMu8ZEYbHeJ
 HPWS+xpa7XOsdYt6MAcAEtut6r/+tvsHpe2KNqpvB8OVFhxwnxWKAjXrFrq8qo5a
 ZOrHnnQTio8fCBfr2yj5ItOMkO3olR0aNOXQ9e/XFBOXwWtyTInSVOOecJQ8AN5C
 /wkNxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj441f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:34:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-707641946ecso10704826d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908443; x=1755513243;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=fOkUbC3anDwT824C2FQEZMOkLtjL+DNc6jOf63UNsTrGLMz/GT007mfl1WL0YQlwrG
 Hwih/8SpK/D5Ya85Esq44TO6Nj5v+DTQsuOX4urBWYFi0U3bmDjD4ZTf74l0bv9uubnj
 amSoaiJfCAmkGTiOsYnNhDhRFeL7v0n3v5dujIZFG1Iym72R3KDq2Kju/+YCQ7MrRzyk
 lpbDsOQTHREflx8gc0DrBETMxHRLFpckxZEn+OA542n9/7c3Rfy6dOdC27FONiidALjB
 gmnHX6BpvQUtl2E8U7Fb0J5hslyXGm4px/ee+sO+NibBVCoJJkAC6+HEVui0IniL6g3+
 F6sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeW4IDgco3a2fRMizC175+YOOGhw5fYjKwQsDcmdyhRYfG5qEGK8Y0v+jniW9x3iPXHYsbAc0ApZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5DW1/FlfzUhBohuWPDk02jb3RzjvRtg0ZaiXSkn2o8gnHa+hB
 oiKK3yercnKPlpNnCOvTjzvRy/4EU2AWxiPL59hMRZUsdoI0+/L8pVoydt+U4nlpg/U5qeXxHME
 i4S9hN9DHMjdx7kc5XvU1sqcW73gKEYqAPjQxLruSCAmx5YFlZRrGWW0AhmG8g8OQ6DU4zWg=
X-Gm-Gg: ASbGnculaG1JZ6ao9GAY2VvJXnkrZ1mtuntqStG1e2UBcndxyGOKxQP79uqlJDZ5jcy
 Yx6bTLU+bC9/E1ecEXHv/CyGDgX7IcHrUS9Gn+fBePai4WtihMlOLGrMk8aKgLR/hq/S/ta1W63
 g76HygtS8Duztcgm8bMeOZ3LiDJFNpajJ/wO6MH6XCrifyweerXI+5qq+nl8NqOn0AVtaJLN533
 IiunUzDXrph/amcfNpE/hxH7k7ZYwHdC60Oek5x1cs7vjo9fR6tNzUbmDVdmtb6vi5iZxXyJodJ
 NZsSbxY6emSeQh84kbJBiU+y4dFebQ74gIFTGFZgEKieTpjdn1MxMgl/Fd5JTB3y9lhTrCRcCzi
 U8LD+6z1HYnccWT6iFw==
X-Received: by 2002:a05:6214:2608:b0:709:23f0:f50 with SMTP id
 6a1803df08f44-709b094cbe7mr53402186d6.8.1754908443208; 
 Mon, 11 Aug 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXju1O/sKkYY/b3BkoXU3yRD84XzBcfZoJ/QUx+rjP0trH4Je3JcbjdMDL95C2fO2CoviQQ==
X-Received: by 2002:a05:6214:2608:b0:709:23f0:f50 with SMTP id
 6a1803df08f44-709b094cbe7mr53401926d6.8.1754908442594; 
 Mon, 11 Aug 2025 03:34:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:34:02 -0700 (PDT)
Message-ID: <0a3698bd-01bf-4882-b41c-426bca328e40@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
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
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX1a40x+FNHVY5
 qrh2jYTQ9Ly2smcy/idY5ySTk1pWlDTp8gMGT3heZEhEulxjwpTBcZrLdRx7JjtlWFJHriF0Q4L
 4wLoPAqgHFUgzAhdEySZeWT+Cs9piEeeI+yIPJ0kBvuwVCW2gw7YpPnSmwrCMdtxbxxt0OW5q75
 54Nc8SO8NYlnN+ijuMa3SU70JYcWY4Vo03woZIgE2UblrabXKYaTXy6eMl88KPn1+X3KN17dTLv
 AHrpBBkvNzaXt4n0yFxmbqzfBcTpdPC/WxnXX9vwE0Fb0uDY4vdV1sQsUDHJNoblgS5nZlAxRbY
 omQH+prvudYK3ptiYkkgJV/Y7ObnfWyx8SUYz7EdRn6iK0MPpUjlON5S0KUUFjLJZqNPId0bqH6
 voIakBqz
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899c71c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 2gPbcdyzDE0mV-Qy4Pfa85tmFkOVfGpQ
X-Proofpoint-GUID: 2gPbcdyzDE0mV-Qy4Pfa85tmFkOVfGpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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
