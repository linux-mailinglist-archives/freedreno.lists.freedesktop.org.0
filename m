Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABBB1BF4D
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 05:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF62310E2E3;
	Wed,  6 Aug 2025 03:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3NOzBAe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF19D10E2E3
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 03:32:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761eoeQ012619
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 03:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bp0e1t87ImDZTopBTTYuyUrx
 Q5c7XAIZXEo3/bApLtk=; b=H3NOzBAeKdtKarKmdUnhoOypiXBVExme4WQw68Jj
 e0Ar8g1fQheujC/POvP6jyRILOgNON0357Xa3OpDg//77TllFcPfHdgA0FwhYR2u
 4QTl230rC6WaeSjzBSQwKuk++t3QUtBDKWaq8Mia4nFxR6MKiEJ/Kdl/QsSDFoYg
 Ayjeb2UOdZmm5m6kXRWyOTNZKH0IBg20ufthER5+qhXIZI5EEbB67dfme/b//ovZ
 aOFtYt+JiBhiIqZasgiYnomp1VYLkAepuS//rmPeVwlsFHm0lf8P20ZibCmwhzWT
 Qq6kpVGkFepgyJT1hSF8nN2jq+AVOr73y6S57ZobLxupvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvys9x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 03:32:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e665a0cddcso962147185a.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 20:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754451147; x=1755055947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bp0e1t87ImDZTopBTTYuyUrxQ5c7XAIZXEo3/bApLtk=;
 b=ZvAGho9hYT447P9czRm7V6fTK1xJG7jwwt455eO8KzLWp89QaS0DQqm3sVMkhtNhoW
 53Fem7nQLkHe0jmxT8z/coHP6SbULwJaTSNALKiWKs/JbQfXJc0WC69Fs5RfQOq3QSgO
 g1wR9eRY3WLWHQx2FFhSgSwO2d9Dc+prLEK1E7GlFpkrGfT6b9KvPgRQ/fKT7GVRmY/9
 cfcTIMxUC7KqeoeEhGqKiQ7QmEDPLWcSHJEl5FwRh0w0nehWQwwSkvw20gX0hcu+ArhT
 Bd/smI7F7WDGi9vj6xVbYN52eH9blRJdkiSFDOQc1t0++meAXfKMY8eTy/U2U75+K9wS
 MVLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1M63ilHsJ03OF5n8j9UYgqH8X6nOd/MS+tUpthlk45m7hV2gmnFHeUGg24M4UFbIhixMhv4YcU9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfJxu6DkTYJlI4le3qRGLQ6aWMMEn6uPT7QObzpM1toKdCBevR
 oRATg6ISX1f+MEIto4ZJZWD1mOqbZbaW0Ua290Sc9cYkDDQ3ALul+11hcZTilMk1v0+G3nRtve3
 BUs2Pm/hEirSnoEq4e6osuKpnjIInkdZw0/RCOgBM6Y41CCmTRtdtyEyaH3GZqcMjkTfEgls=
X-Gm-Gg: ASbGnctpmosXDKieNe/4o2anhAgcqZsK/gUXCBuj+3CD3XdVoYz+nKrl0jJ17I5lXym
 a9Dd3OK2RiNIo02s9fJRovIpnQYwOAyZgirzfUpsVofteJrSNnPjU3BdrsOpXPJpjHZAejVpG7j
 Lz3Q3AXZDzHUMra6hr2kUUBl3OXT0oXY78+m/aP/xbBWtXPOmVpnU0hGFHD/MZUflvmCfp0mok/
 VSa9IgBWQyFsGZQ/A/uM8Jz0adixcHhwKkczX4Hqy1t94yaLEP/EPaAoM3qTIH37emwx+BgJ38r
 2YkNGotV8wqEODAfeDTwBtSSoOMKYCZSJPZtnpZYo8p7Md2JcHPk19Ll4ZZYubFtMSdEX466VTP
 H55e5eQJPDFxBEdwyQ1tyeOTc+W8oLqQbfku3xMZHB46rQ0Fo9aJY
X-Received: by 2002:a05:620a:2549:b0:7e7:12c1:8f93 with SMTP id
 af79cd13be357-7e8167979cdmr148179185a.63.1754451146970; 
 Tue, 05 Aug 2025 20:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7yVn7ORcrOBeeziceNORYHI0f/zhevLvW7M4a3MwVZorhSohXkORjlxptKKnzNulfEggRxQ==
X-Received: by 2002:a05:620a:2549:b0:7e7:12c1:8f93 with SMTP id
 af79cd13be357-7e8167979cdmr148174785a.63.1754451146366; 
 Tue, 05 Aug 2025 20:32:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272d10sm22210681fa.4.2025.08.05.20.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:32:24 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:32:20 +0300
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
Subject: Re: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Message-ID: <xfhxrzrzct6n25jtoaacptf2grd44gazfm7fkiyqlhq5bjqujz@bjvacutguagv>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
X-Proofpoint-GUID: VcyM-kYjQAjjzh7afYfgyUSCxh__iK8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0fINrhEB+P5B
 Yxyhm63zyZqYDAXBW1pFAxeUajNX7KhRjMtNYAwAH9G4SOUxPRGT9V6rQgxy8zYhYUQlQwy4j0G
 rXsaGr8ht5X3QUEmAi5jYx8clziHa4eCZcM+pTwGRnBcaNIhN2Z+vGoVnf2aYP0x2vgWLJ1T57g
 qiCxdGGKJWa7enbuyunthpuFmxoITTUtv5hNeuORPEyuE0q52kHzbacaGA03w8Oclsg8dFaJsPz
 bNVE3QFCMowCxvGidetKvkxeeu+TVhaF8/kb44eSSUxihO2Ld6fmqT9RIbWNt0PG/C5sat80PHL
 cIqhiLQciB31tKwtvPr2S00ZRACxIwxRpZ7EYcoPggH0xuZ2PNeArenJdcCRedI0zSbTB9DJE/2
 EWQpIaeD
X-Proofpoint-ORIG-GUID: VcyM-kYjQAjjzh7afYfgyUSCxh__iK8u
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6892cccb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qcYK-ZiiYIKsHLxbHAsA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Wed, Aug 06, 2025 at 11:16:49AM +0800, Yongxing Mou wrote:
> The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
> the SC8280XP as fallback for QCS8300 according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Bjorn, is there a chance that you'd ack merging this through the msm
tree?

-- 
With best wishes
Dmitry
