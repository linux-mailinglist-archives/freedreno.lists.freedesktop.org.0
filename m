Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EFAA4416F
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 14:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D1010E695;
	Tue, 25 Feb 2025 13:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2eNZhub";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9EB10E695
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:56:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PAa73l032596
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vBY5RYMViCND9aWHIb0vvyXsjgb0Fn3HBfOa7+4/rtg=; b=B2eNZhubz34/eSks
 cckq449GJPS7tEuL/u7iRFFjz99viuZvVhiJw5nduwcLqacLfu0CgkDWkNMIdyX/
 CAkiCkTazrlj2uaANecC9fYEZSY4EyxSU3wuHtIdY0Lmq9fzgDweoVgEecaQOntK
 fnQufaDLyXnw8Ga9uNN5TN1U+6lvq5GW8xBz4tXQqD9cn0kQdLcgBa+902ox41qc
 noqaKq4rZGlhKZ9fpQUoX0qvjeIwnvTHlVl7Ud0JphY/OlcOHoNGHwYFIY1XyiFO
 CpHb9c3g/9Wta/VRqy2RpQwvWhBw+B4sxhMN2QZHfz/lvnxHo2nbBVOu1i13U/qC
 6MPr5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnh9s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:55:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c0a42024ffso91586385a.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 05:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740491759; x=1741096559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vBY5RYMViCND9aWHIb0vvyXsjgb0Fn3HBfOa7+4/rtg=;
 b=lIx51NWbeIGQIrUAsIuh9CAm+Q3ntkgyXPQy0x3U6V5V+f1PDavkQIx5F0XdAXYsLt
 7dSSqDJ3dJ1eNh7zE0BiXBDrjDIUEB7Cl34rtQWhUxtFB0g7yylNRUJVcH2H5+59F28n
 w8GqXVXnXsguzgiPCFAKSbQDyVLovaJ6gX9AVkt1q35eChgTUwsHPttYiPOFOp2Vx7oO
 uMBnFf3UYFKRJXZkDXjBtrameys59cwsMkR1Z1nNNUhUumCn9rq5Izl9UXQaExgdY02i
 ydfLcUNpM+qoD9meCabDdfSa2ctxtD6jWcgtjNAtVe1sHDnIyO4ZtUhRdHmn+WIrAmOx
 zizA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULd5UFHQI8Ld9mdx3P/XaZHIc3nmnx6UgrXAuKOOxz2oGaU8e/WQ4LhAxYa9HHPvL+3M/4fmoNY2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqB5h5hIg7MXvs2wJPBQa+zt/Gl6EORz7ztSlUEuwHuD8a6sPI
 WMSd91kTXFeIWE+VpLaVwOsrUp2DvA7EeVr6n/C+iihmcE5ZbfbpMsl0vXwjR126czhG6dTkvs7
 HyVsQ2QnTf8oD9MHJsTUzMFRo40MH1kKdoNGciSQRM80Uh/Dkxfq4Q+I9FpmVK2aEIM0=
X-Gm-Gg: ASbGncvSbWH4xdE9CiFlOWnmFLh5or24Sac+5X1l9in9hBQzs5X4Ozml+dfuYS+aPKt
 Xv+/GmIjMG6TrLvc3t/FevB9F8nYL1lFud5/IZ2kGhcn4UiRqbRw57I2JOIkLrGl5gyAxksASWM
 Tlb1kWWPKUcZcwrBCPU3LgcZRsEZ4Wmhp/Yj2cBVh6JIzOUhrKhuUnqS10Srh/Yju930nGZ6/3j
 nRyNJfUnXpLTOCRROyCOR5RB+0rYdvLL+IMyyiR9oFXWuTbu2MMpvAyBAuVDoLBaRPzk+KVzSd/
 ZUZtJG1p7eDPs6dR+O1QG5tjahs18QShrFGNfFYKU5S4FeUyeMtttq0zczmslovO7ihv5w==
X-Received: by 2002:a05:620a:2444:b0:7c0:a1b0:1ef3 with SMTP id
 af79cd13be357-7c0ceee99a3mr916340185a.3.1740491758842; 
 Tue, 25 Feb 2025 05:55:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/PjnVD66AJHeVDtIRjlMA2STxMYD46o5L45WU8s5YvllCmc0/7XQePe7pEpigxyn6R/Byng==
X-Received: by 2002:a05:620a:2444:b0:7c0:a1b0:1ef3 with SMTP id
 af79cd13be357-7c0ceee99a3mr916337085a.3.1740491758404; 
 Tue, 25 Feb 2025 05:55:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e460ff863esm1239615a12.62.2025.02.25.05.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:55:57 -0800 (PST)
Message-ID: <b5ccdc2d-5f3b-4a61-8e14-697468dbd62a@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
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
 <20250220-fd-mdp4-lvds-v2-3-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-3-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o812TDWz84SPoI1cRk-1y8J90JZaDPy_
X-Proofpoint-GUID: o812TDWz84SPoI1cRk-1y8J90JZaDPy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=781 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250095
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
> The LVDS/LCDC controller uses pixel clock coming from the multimedia
> controller (mmcc) rather than using the PLL directly. Stop using LVDS
> PLL directly and register it as a clock provider. Use lcdc_clk as a
> pixel clock for the LCDC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
