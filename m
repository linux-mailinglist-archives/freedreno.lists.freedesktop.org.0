Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDCDB20579
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02A810E431;
	Mon, 11 Aug 2025 10:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5kDu+Wc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20AC10E432
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dK4u029604
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Z5kDu+WcZfL2dd11
 PgqCrzZRc4uUMFixmVOpyzB3rAo0AkBV8WuLjnKlPJy/gRNVEoQFZuhdGi5cBPIc
 jmQL+384QDMrL7SA+FGHcUcJSd/pZRzHRDNIHKmgI0fUFVcczcs4jx7YCpJu1N0B
 /nocx6w+j9ptPWlOoHymd9PO6JGV97I5wJh099Xrxuq+YQGFCaDJzx5NX+Xwe5eq
 aLUCr5fHKszEnTHK/Y6/2c5KnMFBSPCAeDlMleneI7jJWg+TgicWGfY3+qgRAh4i
 O8UNg6AEEmkV4R6U7nj7wdwB9QABdVDbeMNSI4Ox7JdcpCRhJCrHkeeDf5zB4M36
 Tm4qfQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sm4ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7092ee7f3cfso11904456d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908430; x=1755513230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=pyjWEMxL/P0KibyGbjAcPUvRiVZ6CgAHBpIq41+69W7SSIAnOg9MsfReOjNWFiNZ/u
 RSlnNmcg0mHPksaXyfX7/Nwtcflte1H11ISPR37NQnnYXlbibXhU4eHyPtjIridjnQEa
 VtsnmGoyuZoUKCdx0lKXEvkSe1EhYlzlEuMd9Jeeg99hmq6QpFOYDnGq4I0/L/E7DEEv
 NFHC5d3/dnqmeyqye16KdyXGSvoPAPOr+LoH0ig7L5HEQEKi0YUfIUi5zjr2OZ1NqMp/
 gGpBH64AyVp11uXEG7j7dBMMg4Q9sy2GD0FbKlQyWXdQPgNG3FZdd2W+PDgGgVzBtoY7
 /OkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl+wEFm1WWTwabyqFlsDFWRfeSeERC36Q4JV0Tkug2J7uyrEq2jiFY+EWGeC28ton94hIW3NLCZXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6BLWquZDRfyVgK8krV2Mcb7EGtmZMblxNZVirfzpZux9bQdtV
 gwlgW12eMEpECSSZ+78/1nwiQU1In1hAx9yxU02czfcopZ+ftckAw8mR2QZQjJEUnVFogBGGQmU
 soKqXgjVqN83bPHe8xTieWTP4HrzzBSpDsr3OZIIkhiusUzLMLwkuXUmVY66z+tcuMob2VzE=
X-Gm-Gg: ASbGncvJMmhFCX7OX7N2x5D6rStuOjAmkto8BGZn2Uy/nomOd45z6k68gfkVRZMNvLO
 /66RAwv6mIvXfDhBFzxvEB/PsOYYZCsK8hDuVkZWg3zT6GfJqy+ovSshEu+YENQR7DJgtdJqbZe
 A/C5ZIYUU/bAkIQJ2Bnt0ZdWoo4Aj9b0KnNIzvopvmQ4D2umwK8Ya9wBApELRvenHjOnUWphEDK
 VGSTbJjbMEISLaBVKE9CGO4GmZar4cHM9cYYnWI8Km1zGXz9jfwb6oXlrQQztUrOBtB70XO9He6
 8Fr0OTPdjG5yrh7bw/Exp0v0YQZ3BeOqCCxdbti2UlrQh8OT/OVyCyK+76rWHTlpeQMrEvr/USE
 CcBHtZ+hh9TBJ/Yz1TA==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id
 6a1803df08f44-709ac13197emr60600376d6.4.1754908429961; 
 Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwOzDhGMWLmN2i3FgRqYSnMd1Y5AQG8+nCHVP+BeNYZ6Jxlh5UsiiwFp8nO+Ut0MqRtRL5Q==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id
 6a1803df08f44-709ac13197emr60600116d6.4.1754908429253; 
 Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
Message-ID: <caf2cfb3-0076-47d3-b663-ca2c1bd21c44@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
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
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899c70f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: jJcvlC1yqQCRBTnHtazJ4uyT3KWGFjrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX2tYyl5KS/hgZ
 LXxL1ejlHPd0PvCthETvrJ0n+d5g1F2I/Zgp7lwPXDiifjbjZ2nGcrvA7Jn02IbO4XC0Yxnys1o
 a5Yo+hUzj8hoGH6jX4PeEpEaHVxJ/f8Yi2HaXh25VHvNujzuDZ2yAF2AHVEu5q/MtWP6gewQGLy
 D+JFnaMHt2VmsccIjb33pNJYdyuprbwfvSHxjpMcKmTPtKCKA2mvm/XOW751ZgURE/r4SZNoix5
 Z77Q7kLmbnVt9rgETtfdC8xTAGNYuued/b+2rwKk+a+AdOy2z+l1C3rE+dRwul+BvIyKu/brniz
 6oofMKPurGpKiU7LLnoREIN256O6xXm5Iv6NIKkjlW6TWsY6KWaHN8kOEJ6oM+XeQcmd3aWoEN9
 iz2sYPRi
X-Proofpoint-GUID: jJcvlC1yqQCRBTnHtazJ4uyT3KWGFjrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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
