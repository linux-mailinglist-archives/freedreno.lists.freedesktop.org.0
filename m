Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939CB1BF5A
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 05:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6451110E71D;
	Wed,  6 Aug 2025 03:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky5hYJjO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5C10E71D
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 03:34:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761eq2F014359
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 03:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vth/2Y/jgsPixg8dhAKuw2SN
 Go8Ue+WIsJu8g0n76us=; b=ky5hYJjOnww1R/xoC4N1pXPVFWroBLAe5pfNyjWy
 66AqCAs3NHStzYDJ1JJoL1iWs74SksGM36HfTCwAAgFPNjW1KEV7oTQAeJA00FMx
 yzDWagytDuOdPwbVUdq6SD68LVW1P/Kb9epzZcap+Jo+d+xDmUyB7PCv/XhUiKrM
 3Pmv6UvuVH8x+0DhWSROpkExfXOF0dukgqXa7sZ5PbCxQT/p7c0/cPJ7UOKQqdVG
 XlmsoePLIo7su/iy0Jt2gdYAo7pHIJ38NZpU1i2Yoc4CMNqkICZ8ssML8FKMKj7N
 +x7uoip+lMbk/nGPVUqZpRgm59TpRWPfsYsqcNIgYxdGZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpycs9hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 03:34:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7073a52a800so108463976d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 20:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754451281; x=1755056081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vth/2Y/jgsPixg8dhAKuw2SNGo8Ue+WIsJu8g0n76us=;
 b=LWgXktUHk5xaH6lcI40vBqyXoTPQp6MzFPTDgoXBcU/JdkABDxSq5UMXfLady1YKYV
 kNqqt6XREruY/pjsRKJt7b3KToc8ClQs+JbVnJIeGuhCRuL2oYBz9OS7cmore5GrCiIm
 BVl9++wUtjL6gIXbrDimKWfKWkyqojH3nNmpkgnKqL0mV4FTgHYJgew9n5Yt69CB7Oss
 oyt2cPkfdeP5UzTcwLtPjAHajg4gI0rzB52Y0JUHM523etEJS6tUKv2DMnu8y0t1btYd
 MvoqsbtUHjz57I61JGX1hdVv3Z/zp8lyTZius8J9oXULg3R9LKo58LzUduw9lwx3GLUU
 Nmmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOlGa6D+mz0EmP6mSVt8KjU3coesLbcAkeAVyO0bM+U0bJakKYB3iHBiFzVwRn3eOy13+L2eznq0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa28AQMasQBxMYoJchYKmuyhggZ+T1blMxPtKu9BDcrc8AyI7S
 YhPGcDoSfr9ZkxpWrSsPtstfEvcFBYh79XQh3lHTRBtNJwJP8GmpbzSN/BKoDRoCLNJ/dN4zfqb
 rT1UCUVc7h/V3cdNHKMWhE785Lil/76Vwy/zVRcFkNObBhx4FHQSWBGorZpEM+qWMRLGgw04=
X-Gm-Gg: ASbGnctFw3UPjp7xjzoxep39rt7z+wPQNCsVaX8iFKqgJqcKpkHnKNg3DArXGF941OD
 lV57eBWRhJCvG9llnVMyxGMbb2/xXi9U2hTB8ArkZBAsERZaLFVJb8YgDnCYkHum8StQmpu6Keo
 oaou9tHH1LD9+fV7M2keQ6V8WuR/zc9AjKsZgBz9AJziIRHGGiPkRk50m9G1vPjQSGjLJl2nUUF
 ncakDfgF6lfVnEX+dugKXv2H8R/gwIKSdEyDco6DZhmmkYT5kQeSO0aMgjK/X6xxrL80vrH/wXv
 96nOU+y/0qsC4Gzi9lnmbJ7+fWkLsrnveND+FdltCkCGRgFJAyBZbiUyt/3ZBskjYdVkUuAlPjO
 5LwU55hBxFkjmVtpa2bzI4Jw4mo+K1CHPV0yXqdTnvliOsOy7e1lE
X-Received: by 2002:a05:622a:5a99:b0:4ab:5c58:bb33 with SMTP id
 d75a77b69052e-4b0915e48abmr22498961cf.49.1754451280632; 
 Tue, 05 Aug 2025 20:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7vcXFUJ30iJDUbRPzNDGIhCemggG/HQOqpvhQreed4gLOPOyKQ2xyiSwmnN889jRgtv0Jfg==
X-Received: by 2002:a05:622a:5a99:b0:4ab:5c58:bb33 with SMTP id
 d75a77b69052e-4b0915e48abmr22498721cf.49.1754451280181; 
 Tue, 05 Aug 2025 20:34:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beeesm2165977e87.17.2025.08.05.20.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:34:38 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:34:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] drm/msm: mdss: Add QCS8300 support
Message-ID: <edsul4zxzcgg2lglxpor5xlzfq35c7r6gmw4o3iermf4z7ftpr@elzstjjft5m4>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
X-Proofpoint-ORIG-GUID: 48tGlvyyY9-LF0Dr9TfpWBmajEOGGNZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX7lXs58aUZGgc
 INockTwoshA4RSQWhR2sleucBuhYAKAihlbdSjhC/yhWI8tSXeHNfR2mNCN6lElnBg1HUnAiN3G
 kHnbYD2qPKXJXkJLX7xPc4Y53xVZnn1SP+UNnQSfxnPcBdsbewkM+D0H6TVApoNzFmsJjFobyAs
 GmVTvO/ETv57faC/eOpG3wMNOtDwzgYFkvsNTkV6ccYmq8ZEcur34cC/RKeBvdI20OC48E+wbRF
 hqFEVQ4MMfaxuspDnxwvxaKnSTl1uqjL9TeVzcb2YogNHrVe9V9WAmu74F1P8Ljw5+TeSiMDxwZ
 rssrjt2UN5qg5aTzA/+y7b9VTHxbBfn1ErjRmxDCIQ2Ku6kFyhjpKWBGGd94CWMRFxQWsJCsBRm
 8FYu7MAP
X-Authority-Analysis: v=2.4 cv=JIo7s9Kb c=1 sm=1 tr=0 ts=6892cd52 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=FdNK5TKXhCwMvpUfx80A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 48tGlvyyY9-LF0Dr9TfpWBmajEOGGNZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
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

On Wed, Aug 06, 2025 at 11:16:48AM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Nit: the order of patches is incorrect, UBWC should come before MDSS. No
need to resend the series just for the sake of this change.

-- 
With best wishes
Dmitry
