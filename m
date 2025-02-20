Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD8A3DC4B
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 15:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED4D10E967;
	Thu, 20 Feb 2025 14:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+FnlPVz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2A510E967
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:16:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7QkCd009732
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JuYdE4dlbQ4IVCBmM2eClz9fsFF9FHokS9b6ozmwZV4=; b=k+FnlPVzYzdZ2PE6
 Kroj/0BmRoWTMqyMDL74lahz3z0gUJEHra+1atu0vb92f2OmCzhuUwgwubYsaH9K
 kZIijV8sXs4gJd9882zuZr9MDEh8UUUWfjgxceNdpuv0JkcEh1psJ72Vl57W8TET
 6uX9aq//ihEVPSyatHS9FU4PpQjNzu61Ea94TK3akqkIXp3VKOi08OHQ0ftKO2x7
 gFwI3B10Ahan1UtT6vu7pXJTpTM8rTP75+nznsOj+SdU7WYzjUDQ8dNc9e4JhVX7
 qNssf5RV1Li7Ii6Dx4PWwnJOTpW4S03QSjt4nNqlZMn9+Nhk3tKlqe0RUzvnIE6I
 1BiaYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1xeb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:16:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e19bfc2025so1864496d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 06:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740060980; x=1740665780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JuYdE4dlbQ4IVCBmM2eClz9fsFF9FHokS9b6ozmwZV4=;
 b=GtwKXil3hgwTXPrFxJP+Ifcfh5IRTwLP8av1nokGIwYGb+RSq0LOvrmSUpHIet+06G
 9tR7+YqsIi9nTcZrpgUp4bROcNDyMHJ5NToY0kIp6P4NdNX2x7YWSx4V7p3Kgd9wPDEL
 u5w2PAvXXllhXT/uBbYnjt++rXZbF4TiTU537isscgUFn9HdGDYn7hkCFZmdnsKBqg0n
 hewfS7D9NXxbFN+o3DLodpO7kRAEZVKB1gak3DeCIbJ/7vbR6Lp27K9Q8m2IHaXfrSzG
 SoEgf9cV+nTteW6m3agWzPpZO+8nLeUdt/gS2Jy1A2N0tqF5yjGG76bsaw9gVSyAsacW
 urig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6gyJ39k0IgkBKMMVZ0FdNoLQSSoQ2tZIwZ9yKQdCuaoTVOTvVDZbIKXwQDWdjQ4G0mo5Q8rlQyvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJaYbOoFZWeHr4wiaBnd8nTwSHHrCpVaJnbZj6NgEM3KBW8LNv
 zuDFaF7Y3CBrYtywVradSwVhGpE0+J4J5rY+eZ/Ea2J00p7pQpAAZD7fmlfNQpJ4EwTbL7ZmuMt
 RYSzH6MdU08D7NrFgG/Et0H/SQrXU2US2ZSsFTRAe5nBymXGNIABJiUtoHP8VZfGVXZE=
X-Gm-Gg: ASbGncuqFOIcPhP5mVFp3j1J7nsVy+Q5EqgqzjbdVo0klgyxxKyP8tghkIMP4m/CYPw
 FNta27Boy5g4Q6um+bR21tgJFFeeTrdMEBwfER820exApOntRfxuHMPwi+Ke3PV7U3fETx+ja4b
 AIuHfwIEyo2LHCVGex0IJv0ZSzGC+PPU97pvNdPRTc2MVw11NZAAAJ3VM80voaNG9atCXpKu7mG
 L0+g2VouLScwLMYxTJrKY4bnhM8t/7rfi+w8T+bcjhveCXYsTtNHdPt5nPfzeil8khFGcuab6qc
 aPj+zcVah93+JeAAfR0BzVoTWd6VgqSaNqvdOvWV2lsqPTd4CX3amL867zo=
X-Received: by 2002:a05:6214:daa:b0:6d4:d1c:47d with SMTP id
 6a1803df08f44-6e66cc81ee6mr117329906d6.2.1740060980186; 
 Thu, 20 Feb 2025 06:16:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/rtxy8V+ibsuKKWTYNnpHRyUUiiKw18tEiKCIKFtweF7nc0fiGiUTgniZ2kAyBjdw0RVwQA==
X-Received: by 2002:a05:6214:daa:b0:6d4:d1c:47d with SMTP id
 6a1803df08f44-6e66cc81ee6mr117329606d6.2.1740060979770; 
 Thu, 20 Feb 2025 06:16:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322e6sm1462102766b.1.2025.02.20.06.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 06:16:19 -0800 (PST)
Message-ID: <bbb099ae-2389-4b7c-9161-83d8fe94b45d@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ls9EAljt_N-1Zq1uwfZHHn9rewdgc8Gf
X-Proofpoint-ORIG-GUID: ls9EAljt_N-1Zq1uwfZHHn9rewdgc8Gf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=823 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200103
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
> depends on COMMON_CLK.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Ha, nice bit of archeology

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
