Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A1FBBD5A2
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 10:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603CC10E29F;
	Mon,  6 Oct 2025 08:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDhVqSS9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D260810E29F
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 08:30:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960aDgL018828
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 08:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /L1grXilGVTKm+qKpyor+cgwpOJFQIDTL8Rar0TzJG4=; b=DDhVqSS9JcY0Jc8m
 jyQMB9h0yP96EP61LBGxnmgdUpsPoKyoV/Kv7Y0jVT8kQFsJVQUiQL0T3UqexWIi
 8hcWnW9yLrrxT5N6Qj1DqJ/QoMxSpLY9li+95Y4SiEf0fKT9TyfoV52glcV84Xdn
 YDwrZ5aMDoZWF+58kc5pNGsZyO0xJiUS3pysN844F30fZzwI92r4EIAo7Ke9it2G
 ewtmvhHcR5fHU3AJG6KiJbKt+UT30aHPT8+qDgYa4w+LIE9aGpgOj/+v6y37hg4p
 QJepv0vO+vzlDXpEEdiaudL/XHqGQaBuEHVgJH3yU+4xG1e0Z074q7ShDZBV7ws+
 ufq+ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7k5e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 08:30:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-85d43cd080eso146589085a.3
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 01:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759739426; x=1760344226;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/L1grXilGVTKm+qKpyor+cgwpOJFQIDTL8Rar0TzJG4=;
 b=m0K/TI9v8hQ0ZB5liPqahDQGjp/RU5D5nC+eTrMyniMlpIrknrYzVyZqx4ans7WswG
 jUktPtJ/q8rBnKKTwxfEJOcbFC0wJkfm1Mr+v17+7xFySoIETIaZwZxAJ1QWMKFbepSE
 k9AJx4g5icsCfy6sJZUW9qCE8jpLZt5eEEzdYres0wT7/RMyOhA+gZ5CTwMGDRTzaDN2
 eqHW0kCd+HRDespc+e0MpICzzX05amNzJQsMuLmUVxJSaDokJsMTyNoL/zJZTY4PIAtg
 hKkX9I8xI0KKinQiCxXjwI51njYUy/rO+AizbU7sbQrAe5fGir3QQ9sBtL8dsrzRMwN9
 VSNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2x1IBRrDV/FM8kVB9Wwu1Q2VIHZ9CZTHeDJLk9SQ3wAvmzffh+EAkzPe8HGkziYDI/EW/9C77fLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeBECw82G4YpvnY3FQoGw/WJMGVugAN6P0jJBGSinxy6QyJTDi
 As7B03oStmWo82RN4Ajpm7weZmYnT5F4UONqjC0reZyq7NdTAOSH+79miaw47mpLo0BV/RMysUA
 ZUT0r/xeZOM2b8Ey0G9V7cKwf6mytbtkZlgj5J9V7GcHSLrLMWVpA4mNR9APF9n/XUIOHjew=
X-Gm-Gg: ASbGncsNqcsK8b/nF2YXwv8V19GnX6WGCKxZqmlGJfhwTgqn3j0nO5ZYO5KyK9owyWV
 Q+wv7bmunCkhcpl223Ykdz/I/SoygjT4vP/NpyMYo/Y2iQBg2fNzOeqCemrG83oV5cLs38D1K5W
 MxaQXzJELihwFrMRdziT+x7flhjJ0tq5FuEQbzeWZ9DzCUEMGMoAOD2UiaWi0zhyYwnjgpwykya
 PDIKvsZLptFo0EsAqjU4WBovbbc8V3HN2e3ErpuCLFHm3HCei7L+S8inB4e6pokIcG6oz2n9uUl
 5trv3uXXea/td7yyJV4j2koEjc8xPXXzPweA3wptPcb5AE18/GWeHHaej/9CWbCowDzY6BUa44t
 dOfPgTjTZS+lflJoJFhgJblx7gZM=
X-Received: by 2002:a05:620a:254e:b0:7e8:c4f:614b with SMTP id
 af79cd13be357-87a35ce66b3mr915925685a.7.1759739425839; 
 Mon, 06 Oct 2025 01:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXUjSORB8/gdVaqQhY61pOzDiPB5IX7IjdJsn8jA+4eHYgbYcSssD5tm9/R6DxLCyU1tYgZw==
X-Received: by 2002:a05:620a:254e:b0:7e8:c4f:614b with SMTP id
 af79cd13be357-87a35ce66b3mr915921685a.7.1759739425283; 
 Mon, 06 Oct 2025 01:30:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b422sm1100481366b.54.2025.10.06.01.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 01:30:24 -0700 (PDT)
Message-ID: <9320c599-c7e3-427c-a096-230037d5db43@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfXy0azdm1w93QW
 3j+kUhtrrnLNSBfcNKBG5RnUjL83cwjGjR3InOQjobGbk7OVxMc/jf44YjV8M8ooKJ132DrAYu9
 DJQhj6fRUqo8vhz6RjtYthZZa2TsEMhd6HZa2Ktl50lXp8J139dPLPPnazckP1yR0tLKLY7xCxX
 kJf5sLVV4MoNHzk2Y1YcprO9ZepC6KsA3mvhvn9t6yjMxcyY/r3UNnP4Hx+lYu5ng1jXK0A6QxH
 DTROXLSY+hVjX/4ufChLQWi01pqj/Mlj/iOzd4hyftuaT4X2yZDi384BG13/BmKTSBfwJ+8ILv7
 BApFKElRuZrVLaBPojsuUlIyAii41ZYayHx2WK7hDh+D+95QQyxHTN4Ekaz1KxuyWPCLYBu2723
 QcrrKGjcdMxoFxXZsGrO+4n/hnjunw==
X-Proofpoint-ORIG-GUID: mkz0NsZwV3-qoNZTl2xyiJ68SlWKm21z
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e37e23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=pHedSVXj9zt6Nr3hYnwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mkz0NsZwV3-qoNZTl2xyiJ68SlWKm21z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

On 10/6/25 3:39 AM, Ayushi Makhija wrote:
> The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8300_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_48000uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_48000uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +		},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
> +};

Again, this is not necessary, since the lookup code looks like this:

for (i = 0; i < cfg->num_dsi_phy; i++) {
        if (cfg->io_start[i] == res->start)
                return i;
}

Konrad
