Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A635D02EAE
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 14:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FA510E71B;
	Thu,  8 Jan 2026 13:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="esLRBjqq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emjKKWOM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA9210E63F
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 16:26:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6078dqZU2577900
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 16:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=; b=esLRBjqqLnzL1eWg
 btTcXwq6QWcEVWyXOuxTHoX6LNhhS5pZeIM/n3RKsSCnnmE6syAb9UNvN1EiKz5W
 5GAb29vWcPaGoMJ3xOAjFh3aVITPxIRlrEdjeix3HgIb754PGnY4+3/2KiTi5XR7
 +y+QG9EHAWI6xlPUWQ04Nyob7yE5Irt608LxWsSJFwKfdrsprL49m7sQgp6R5hQo
 /RpgVL4Ci2GEgzU7vVDC3owtCvqT+1ssM4wO+85VqWnudolMfWl0aj5MPw6LC+DS
 qQeI7K93AJSQ+5uYdqm3ns4WURb/f9OYq483Hlr5IoWNgrHFPiTB26cvh1RlnUvB
 cyAb0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm659eyt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 16:26:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a089575ab3so29125565ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767803209; x=1768408009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
 b=emjKKWOMO+btGTjTC6FManxJpMnarvEhM/FAzvXPEZ0JS7rFHl3SgJoy+Aq8Te+vJD
 Q436otKU40xAjvjk6fVxr+9ob+Y/l/NQTt8eyfrCpFqyiTEVBzJDHzQbfkMtTlQ6dJQ7
 tbZ9y11+I4H6VYd/JW5OGeN7TK3rMuIXM8y4lCX2RMmeQGRyiD9Nhxla6+ZnCFicW7oz
 CUiuJfdNHdei0MkdsCbiG4VXMcptKy6k1cEVDP0fcBH88WVn13GzajZ+W2CWR9p5faaL
 S8aek6483eimjh+2GsNxqf9BDnh/EDSvFpVa7rxqbYe7NNGGdyFIe7WXLkjfPt7rCqFU
 qCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767803209; x=1768408009;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
 b=PZ9e/5DQLdD/xWNvc75Wx4fgFDJxtJNrXrf/i+9EaMDYCNf9XUlYt+/02WPDSDNFjf
 JLsjxKTH8C3btkaP25k6ND/e/aq34DHbwcgzbkvhTQYQz4XwDq9pBBKP15+qkZriMf4O
 t9j3J+eAp+/3bU1iGNi4+BhjGERazTG4ool8xnvVZoyPzT9wcJPoe7mwUSeLY4Y51HRK
 kc/mHV3IEaH7S3pnFqRGcAVjAhWhnyY5FI7r2qxCr/SbGAHRjtG5hCClyhERaLh72JXz
 uDQI8fzFCl6L5NyTLGwfucTAix3Xa1QT/bkVVNgm9wuZLQ157wtQtgUkTGR8qUTFxNua
 YP7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8OdWqwSGnh8ESn9FcGVUJzfUZdBvDAlSNIZaQVwcQzZD/+4XF273mq4c9qlGFxDmamQwe6agt1U4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfPIoMTQnZ6cxSgg086530HZbYNdMpjEbmDuyoFPc3B+agMl90
 3ngnJBEf238jkR43OuCdNfl6TqlN9iIeeRagJqX6KsgHqMaD0izyY4MEeqRtSVtXk7D3mZHUqZA
 wR6BR4kTSfSs8wEXbKwc/d7L+HDBHfqHSy/bvQxWKU4CqJZeSH3E5m1cnKf49joawDwUEcf4=
X-Gm-Gg: AY/fxX6aX4r/E9v6HsvsrH7aZ916PT9BlPld8K/gTObFVBLi4kSqDW39RnCcc56J8P3
 ovLHfaKM+RjxRPvGUJs6P17qsSpYt1Lv4UQEtkDVgaHqo8/UmlzqgOELOI+jSMnNauKAqhm+2GY
 tmmAzl8lwLx5KZ5OGFOatFso1lkMXY26OQd9TwFRNlnbE1Yo9POvDTRHPvy8cVsHouTUdqZyWhs
 GtRFquNut/E5RMIm4SH7NrABfB8EmuFOViMH1qeao/tv6JQkqrLUQIQfiyttF92gw5aCrZKt6iD
 K3tF5H72MVeELfngBCz9WlMIs7I7Q8igmnU/2jT1EEj2zGHulKrsuKH1OWoSbdMMAtFtFuNc0PR
 XoNAROS06AQxg/9HrRXXNQpj2mg69OWE0FzD4rA==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id
 d9443c01a7336-2a3ee4aaebamr26013615ad.37.1767803208645; 
 Wed, 07 Jan 2026 08:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhDyZ20m0wTcSTXbF6lfqRcelUkGiEtoEtFdPGDtyUaLrGrVdvkZP+XFYxhXeMEZoWEcVI0Q==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id
 d9443c01a7336-2a3ee4aaebamr26013275ad.37.1767803208116; 
 Wed, 07 Jan 2026 08:26:48 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2df6sm55741685ad.61.2026.01.07.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 08:26:47 -0800 (PST)
Message-ID: <fff70f1c-3c5c-4e50-b0b5-c3eb10f67cdd@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 21:56:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: petr.hodina@protonmail.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e8949 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9zcPrCpDFr6Yft4RwatP3w==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=fry8jdqtyFT-MZpSCxoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: pJ007iHtliO7gjyD34hY2q8gFrOC1Uw5
X-Proofpoint-GUID: pJ007iHtliO7gjyD34hY2q8gFrOC1Uw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyOSBTYWx0ZWRfX760wVh7cRgel
 7ARAgPkaUpdL53Ef5QoUf5kQaUUsAwHXiefSrXtWnC70+I/TPJdNUY/ffNFuqtP5IqdXNUz3zSS
 rX5tCnFO72Hu/aZsDcYM0OvgOjqcJpHoH0iSTyVGrXMHdAueDEOD8EXJUvb+vQtDd/eVqqn2Y5U
 NRSXnTUG1r37H3tFMpfCveRieUg/ULQ8mBrvQCB7+GgoLpLS8E1NDz+Xo5BGfFqTdbhIG7nb5lc
 bfC+BELOfbxgGzonn4sHupd6PAv1D/hK8WoTsLL7C9o4F/CFWFCU6y2XX3ONRD/cUUcewirTjqT
 XVqplmkRhR6DL509QNzfa5nJUahqkAb4Wz5l+0dwBHmW6DFbGivazqgw0tJ+0KqK+hnaOkUi2oR
 sY5G/2+GJiit01UBY86Vjrr5zRa9ZGNtYuZe8yTFSA4ghUSEyciZ8tXwL1DbTvxsUVKUI0cngyI
 TYBhWS3hgYfKvI98rfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070129
X-Mailman-Approved-At: Thu, 08 Jan 2026 13:14:13 +0000
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



On 1/7/2026 5:14 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 

Are there any changes between next-202511* and next-202512* on the
display PLL side which is causing a side effect on the pixel clock(pclk)?

> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 2f9e9665d7e9..78e43f6d7502 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -280,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> @@ -295,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>  		.name = "disp_cc_mdss_pclk1_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> ---
> base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
> change-id: 20251212-stability-discussion-d16f6ac51209
> 
> Best regards,

-- 
Thanks,
Taniya Das

