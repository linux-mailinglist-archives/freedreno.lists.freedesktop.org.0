Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB3A99B9F
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 00:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423F010E398;
	Wed, 23 Apr 2025 22:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFbqFKet";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D857610E398
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 22:47:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NKqLkS016813
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 22:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ihLjRZPlLIWGlyTXxQVjwKyUINfd4mtFX1kBkVK4xz0=; b=RFbqFKet4C7XAcmr
 uF5l93uiKoYOIpW8pKISLlNb/6aUfRkdhfZCwj81DjrkRecyxn0IKak+VzOAN1vI
 kw+YX+eCRVZB6kh2zBGWoloFdT/TuLhMVwH0gT6N68JStZEtSNL7tzVY3H1ZfiVY
 CHa4RdeututYol1HUcfFXrxVyeDNlKlJE5a9Sk0TSNKo3p+Yh9p8NxsaUBVo4WM/
 LxgE0HcFg+S4AavN2k5aoumEGjxtKb7wpUPAzlCACltegnXV/j+zLe+JLIzIhFYy
 5gx3+GvOkk4ZnWAcJnq+H4Mx64JafGwPvSVQ285T9vO8vlcFuqIO49KJVHqp+GHN
 dP9DSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0bmxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 22:47:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so79198185a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 15:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745448462; x=1746053262;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihLjRZPlLIWGlyTXxQVjwKyUINfd4mtFX1kBkVK4xz0=;
 b=uprhiRwiH8+hHE7l9Ezr6puq+UTowXt7h8FRZwr4HlKexa/fomS4d5k7HMunns4ngO
 A8OgAeMaaFbRy6r87nV3PynyJ7GmoMYmgRuxxnqJNFWSgRb2FoyMdEWWhozzjKLpJSDl
 VXaPvAnpQWFD2wP+Z4T6FK2VIcuf2nW4H4o0Bmxtz2nsrJoBidk4/4wrW0WO3CKTrx4J
 mwx0qKxjA+nkOH+Aanmhv95CGdFin190GmTlSPc+NDo+/b4HYqtXjHn8uQgJvaHeezCX
 lH9sl4YL4HBBtYAKj7v5CUx1jGlI8v7Imw2D83OzSDynWIre/uMQUHCOK4/O+PgOI02t
 ntGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7SGCzGr16a8nSRTR/du8agXaGy1dgKM+yHpaGDUDJk+XmNpMBMgukDmzq/lY+3AcAP6qgagYgTlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIb5xy4ZDcVR8hIgDQpLihIIdE1oZR0oy4uzsVmX43A8FT+Jng
 oY4Qz7K8rIRE4cv+A/X1bOY2uUSiCO4+qHkdlzUAPfjgC9WMq3EZypLn83TYuBOejE9+Ml9h9UH
 ZfZJxrQrnGsLzW4DBuucPA5LFqGyHb5PjwQYNeyaBee/aDdD0QF5lrFUAsFdiMCxpNao=
X-Gm-Gg: ASbGncvBDloA4HtaS4yGeVMFTJVSjBcZ3XLVdr6LgLn2l496ebC/Pci7ongnBdPw/VZ
 AInX1h2woPtPHBLugXCaRHZHRc31u7kX0gN2U3idnT/bR3dYXxzI7iLbXfYCELAjqSBM1Jr3Ip7
 hgn6sBXG1BvtaDZ2ElDAVUd2Ul8WRshbE7qHXnkh4iN5X8sJdB4VcbhRe3O7TDxxodmY1dDHMN/
 PXlmdYKawsG2g7jx3H//XstJbesezWQaO/3w65RYJB8m8r9TqljFHTsleawKnviFSz31aBnBVBm
 ndGYJqDFlDcKQ/TxQau9yKqwoY4kOHa5fu4/w4hpEGcEtWFBqYhvXP3MayBW3rQwRn/uae20thQ
 =
X-Received: by 2002:a05:620a:4728:b0:7c5:6410:3a6 with SMTP id
 af79cd13be357-7c956ed7543mr92879085a.27.1745448462218; 
 Wed, 23 Apr 2025 15:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGInwM3Ub2jQ1lwD3hZid86OUOjGIyjsbPxDcJGVMhOF+7PpJenxAlmHg66u64h4q9mPPY9dQ==
X-Received: by 2002:a05:620a:4728:b0:7c5:6410:3a6 with SMTP id
 af79cd13be357-7c956ed7543mr92875085a.27.1745448461829; 
 Wed, 23 Apr 2025 15:47:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3be1asm26736e87.93.2025.04.23.15.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 15:47:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 01:47:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v5 2/5] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
Message-ID: <h46amkfanqmu2v2bbsx3f4iqdwxzcgmu7ibngffn4wfavbdp2q@ho6sy346vjxp>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-2-bf9879ef14d9@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-msm8937-v5-2-bf9879ef14d9@mainlining.org>
X-Proofpoint-GUID: zU_PyoMFBqWVeT89_didy4lj7k2Bqnu1
X-Proofpoint-ORIG-GUID: zU_PyoMFBqWVeT89_didy4lj7k2Bqnu1
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=68096e0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1MSBTYWx0ZWRfX38fnQtJl93k+
 OJ07DxmX1j3sCMR3J9lvXievStYKkXN1E4ANDBrygzlAIEq/LD4JUiqkGUdsXBMd4JlaILXPaBg
 MUYC76nKvKasVPh6G+fjGwqEHzWwD5MGmXyJgpRxUb2qJoIJMgPI0ZrnzyJGJcjWKuzZNXYCjt7
 6QdSFC5NlFEVl6o9zYVTZ8Q8v4J0XTO4pl3aNwjmJGjHkkuTh3TYHh/SvDnqaaZAfwUbWK62U/Y
 U0BPc1McmHb+V20zAk5+KvAiAsikhVDlvWMecGZw219n3KM1tbmDBrkBzDcjbxQn37541SqjZFh
 DspCkyUhlTw5/xj9g9JV1iUhJNwEvXE86ThEgiTbIXgv5ls4gC2h6zaUK8wHhfXy1isjXD/vbXY
 on77V6DHxHW0nS30ESfDbCCgIXgDWANHeKAGnp5DQy6TfHRcwUxgRon+bMps/3RBCD75gP0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=986 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230151
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

On Mon, Apr 21, 2025 at 10:18:24PM +0200, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support MSM8937 SoC. Override frequencies
> which are different in this chip. Register all the clocks to the framework
> for the clients to be able to request for them. Add new variant of GDSC for
> new chip.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/Kconfig       |   6 +-
>  drivers/clk/qcom/gcc-msm8917.c | 617 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 616 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
