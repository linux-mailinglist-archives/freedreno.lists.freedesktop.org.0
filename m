Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130DAA7C4F
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 00:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCC810E975;
	Fri,  2 May 2025 22:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0rDGCIt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C610E31A
 for <freedreno@lists.freedesktop.org>; Fri,  2 May 2025 22:42:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KB1BB011589
 for <freedreno@lists.freedesktop.org>; Fri, 2 May 2025 22:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=crpVW1GAkulPAn2rCtcCM15V
 7zLdAQEB19gyDBO//vQ=; b=o0rDGCItaBuJ7oSVDCFdg+Hg9eJDavqd86Et3mUL
 NEbIfFpmrYI+3mFz55vQZNEkz7/WvKKKTPjB/GYN2YWAODLJSc5g2BZlTn7I21k3
 kEygjn7PvAlEGDhNWhMxAeFHfJypIFCeU+HbybGR5g7PiJZHgSwPo8Ak5nD/xaMw
 jJP5NZ0bnekRZuJxbroXlY8Ws5qloKKGkFPYZh3MQmi8V0bIZ8OY7ZG7mhw/FlEy
 Ba1u3Vss6MPQGrfnNYf6BKghMpLjkSLQFRp8D4JGX/dt7vYxa7tiI84mh7TZ5o9r
 5rUS/7I7e1O60upU0vXG1jxD9cLySD65dntDraPqB0PlnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub1fm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 22:42:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4768f9fea35so64247721cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 15:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746225735; x=1746830535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crpVW1GAkulPAn2rCtcCM15V7zLdAQEB19gyDBO//vQ=;
 b=F6s+U08Ykfwq08TyAFjTkd6iTAV+XKlvRrEgbKnkEvptWH0LlI/ljYPT+KeANhQ3kS
 0QoVkVLl6R1HXLlkvh3tHaqIpM/zscGS8OqvjzQMI9Q557xPelfTYbQSMh58sqCphcTW
 1hwSGbljhVR1jgOv77+qLkh7LTY+aW3NmmaeLXS4szjE4UcUY7z8J1kZajGHWoDup8Nb
 +6Mabvfu+niro5OxyACf9zXSXy+kbWu1Ixhlt4Y/VlmGDdWnKO9xTMURumvdZoHfAL6u
 E0hw9k15dEMB/Me4iIqp+X6DASC96uQDmT4tCWjA7/oCEA6YeNWQpTpWyo0Q2v7GZh2T
 UyFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsaGexqFIhnXpZeXsn18ryp9yPmWwUkSZ/JyeIZEppOoHq4MQbHsJmzNzJ2Z3tiuLGFSDucVkHiEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztimgJEaG4st9tHzlIU9hq5Ofv3dcSpXyVb8iJlPKM5bgGlsw2
 ESbNrhWqlcmJty12GonNPz7dM50xX0xS6O4+67kA3/jDBFnJhhQumWN/xKNkM0cJ70rvLYvHTzC
 vEXtZVl2haxIEm3MTxO3mjdSSYVA1A2Pz57auuE76VM4SwZSP+vcfYOo3i7YZJQEK+qY=
X-Gm-Gg: ASbGncsxnc0Co8ikseMsinNQ6gsRp+edEHvDCQpGztOsBjyaf8gvRdZvDyOaT50d8oQ
 c4P+bB6oFD0Zdn5odTEdKS+QSqhKp8i4lDupkJvZDH5/22rzYig7AxyZPrlJ6CbkXV3uJXr+H2x
 NqduSulO4zGqxLgMEMBHzUhUX6Nb5NUYJG8BFqeiviuSJdoFBRcPx9uKFb7aG2tJnNJDJMDCXx6
 mBEOUE8kU4d5ws7oguorH8Hp//fU+7MKPz4wR7LpcDAO48jDvMO5+vSBjm2YBCUt1k+hyN43q+3
 /0BPlhsIm2mrcvabDudbmJrBhHfU+ptCaHDVTfaaUdO1VJ0QgYzhvrD0JFFr5pwdP5SKzmlLKeI
 =
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id
 d75a77b69052e-48c30f6e31dmr57477301cf.9.1746225735440; 
 Fri, 02 May 2025 15:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlIBZLX+XF9YXHrK8MhefSo38cVjTTSSX+WjsmilD5TLhYOiseMueK4E3PQfWe7nPXtR89dg==
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id
 d75a77b69052e-48c30f6e31dmr57476991cf.9.1746225735064; 
 Fri, 02 May 2025 15:42:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f219dsm516000e87.206.2025.05.02.15.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:42:14 -0700 (PDT)
Date: Sat, 3 May 2025 01:42:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
Message-ID: <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
X-Proofpoint-GUID: 0SXPDn_MZ8Ezl-8V5v7o4qelRhe4tTGf
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68154a48 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Fh2Cff8sOiI_5vdZZhwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0SXPDn_MZ8Ezl-8V5v7o4qelRhe4tTGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX/9uO+E+ZE674
 0gbMc3D5iVWLYIUCfs0cOb2cwjLAYiyJqzuGEVsyNS1zP2/Z5iy4koGIT+/eWfQ1cp8debFzxGh
 Te+qcrcKar0YeDhAq91bZ+q88CFE6fhgKfN6aB4CpEPRKg8g1WLgRJjGx4tEKa83mm89giMpPzI
 Gk8oMyy/Pev2kty2I1/lJ/x0kP6rfTUTCKDw65U/Q5C8LshdbeEn79J/AKp52b65Gwyy1v7pYQU
 923YQSLD4zxyDCTYxJtDedrtBViA0tdEOvcuMvu6aklfpBdAoB7YG6NhGFRyqxA61ysWBX5hxzF
 9E1ENonEpTGjI27GAqxAAi3TyCLf2sMhK2xYDofQaWhD/IaIQgs5ipsEvoC+2zN+R+3LBrj4Ou6
 871g2Rj6vNoGQdA79QCOf9+PUsnM0rkZ8N+4f8+Y+45i+GX+yeEPXlwiyhFO1heFoJV1SiIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=675 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186
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

On Wed, Apr 30, 2025 at 03:00:36PM +0200, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
> enabled during rate changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch is independent and can go via separate tree. Including here for
> complete picture of clock debugging issues.
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>  		.name = "disp_cc_mdss_byte0_clk_src",
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_byte2_ops,
>  	},
>  };
> @@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,

I assume that these flags should be set for DSI1 clocks too.

>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
