Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF06B2057E
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFDC10E2AB;
	Mon, 11 Aug 2025 10:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pc1LXYLl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E1F10E434
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAV1029206
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=pc1LXYLl7ATW5RR/
 kv8JpWpVMMWw6zDJPpFQHQ7cxCdNIoJw23Y6C7KZquAnSB8OpJRQyTNuUJmSS2P8
 OshHPidOWm4CVWrVdmth4VW0r4vZPE55OsDDgssvmsUTt/BdbJ31BFlZgtSgKw6u
 E5FvUgMV20hUv8uySTQi+0+JWH6RpvQtQ7NoBGZErnvXEUYUFo47K2YZFiQxtGKy
 O8OpMdA7wDrjvoHYcdH2V/PTSigHqq6CGLD6XUhkV1u1O6BR68MvKKcxgpf5IP4F
 W1/hcINTOUS+nKozwZdV4icJmqr/nJyWezckGN2Zs8kVO1JGkW/50a5rEpNKXsX8
 CvANDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbygw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e854f77629so5373985a.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908435; x=1755513235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=e/EKaqakAaQVuxZoioNCb+7+IojGeDPkcH3vbBXF85w2cd2ODddT0qtQ5FIYn/uZJ9
 Us3kHRzVNYCiY3HzGbPr9AvAzG41z0YLNIZw8EmFTWleSN9XDVcZAdf4NXisBzwMqtWc
 4vTqWZhzIaOcYjeo1NYrORbFgCNw99qTGBviSB2K9fIxL9ORl9F4+/BG71deeXqtTYwu
 Cjq99+JsivS51QKw5Iyniz+vsg5OkUMSGgUspOW4f16y9Iugjw0JL4ycYBr1bLZMgROK
 po7+PeAQE17kZB3ximrinZl49N12eXWuSfT4QY0pqRko35HjiRT6PNMVDCyU0PdIwCz/
 fNjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfAKZ0OIZ4lCm3vfYjzzqkUIQb53JlWJMyPHfSwxc+DlQfZXlOv6LimlBZWQLuXpz+cC4oweDd1Mo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdfqaekcuLzTpk+m1VgvYMwLtbuwNAEahzsvGujyfcy+ADqLVK
 K8FaS8sxaZKemz7R6kr5/3PCLzawhOYNoVHkwO+j/v/ggQ7za2Rh0HdpIMeT/lKck8XZn+qFuey
 co8QNUvlp2F5r1i2iDGfUj7eZu6+2+eivHl1Y0IuhEgYETOaMWoQqAWM7qBlWWt9kaDOGLXA=
X-Gm-Gg: ASbGnctjoF15gx/VLElRzyBq/h+q+evVitc7HEgo8v3y+Vo3yerlRD91dwS0uY5S8U7
 0SZOy8yAU3TpVQG6byqUurjf35UEv20J5YU1puX1Df0G4D/PrKGF002W4Rn+GvO7XvfbZYmtr4w
 4MNh+E0/ZhDxZ8usTuTZYp+LDzXSXnpDq3Wuz5zFflK3jYzILGNQQMAyl3PMwpqTW8/q620sboR
 fLvi+QcqfeHhuer96GMxvoTWi4KhqDnQUkz1WUUV7GecEoVdmVec0XhOfkRs21RqMlQX4co1lW/
 bit9zyx8x3zpPoFj+XZMUImcvNmRQ7wppFqgNuyFHstXRCJtZIksVpKoZVEVqJjUWL3YjIjH/mf
 V7hFx44oHJ7mvc3k+SQ==
X-Received: by 2002:a05:620a:29c9:b0:7e6:9e1a:19 with SMTP id
 af79cd13be357-7e83b93732bmr541387585a.13.1754908435022; 
 Mon, 11 Aug 2025 03:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbXlR521bZxyPm/3VZyKzhpc/wr/UGlYqSFDZBHoNqcD9JWEIFdYtyNL9kNg45d9xLhLh1XQ==
X-Received: by 2002:a05:620a:29c9:b0:7e6:9e1a:19 with SMTP id
 af79cd13be357-7e83b93732bmr541385685a.13.1754908434580; 
 Mon, 11 Aug 2025 03:33:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
Message-ID: <09144409-48ea-4b74-aac1-32000424a46b@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
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
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX6VkdNVyxjv2M
 U77fN5L5gxqhuHM8/ybooTfEQ3r76/rItdAqbmljQKTFO/rqdIV+i3p77IBiU7n3pcCK4x6Wfom
 7ppG3BcXLMl+CPEj0h3np4FOVcM/gCuqYlcInLTClHI2RbyVw3u4Ut6lcsyH5MzPpS6KvSiKyhv
 CxWni4/EAlFf3hj0UxHvCTbOCDPgMfYAF2cD7sKeeL7eTMJxhDnFSArAn4l5QkkPL1qreFIl9ku
 z7eqUwX8d5vRV0+ohfZEgNZXMikf6IXemAjgiNUILMpZU2992t2K1vjUAWYKJh/Tio+1UMquA3X
 6XuhDqSgw4RmWnWg+A+7t+bNoK/ZzvP+bRSwQWI26jx6orbYeHbcDqo7S08g1W5YJjHDrapaeZ5
 ZM/T0Nhz
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c714 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZnG7vHKt0vMfvfy9CMv3-LbT2KC9VoYI
X-Proofpoint-ORIG-GUID: ZnG7vHKt0vMfvfy9CMv3-LbT2KC9VoYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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
