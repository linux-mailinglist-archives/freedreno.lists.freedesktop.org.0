Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B5A3019A
	for <lists+freedreno@lfdr.de>; Tue, 11 Feb 2025 03:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC4510E1FF;
	Tue, 11 Feb 2025 02:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfDz4OQU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8AB10E1FF
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 02:40:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AKenLm011856
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 02:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5WY8N5ks8GYUyNu1nsdKVcNatvt1ZRhBofnP73+/Cc=; b=bfDz4OQURTIWt6vQ
 wuUL9s1UUob+eLYOJ9ktApZV/AK4m3q6MPe5KKDL8OUhn7ShzF3YpuaF9vBvBTHa
 qacOs0HFSpqJB0EXkJ66XQQhXsgEubPApLF+jEUyr36LsqM7s/WAICDUIK7evo1D
 8CeJU9ABjGvFPOkWbWZ8MJUN5PFu3rdalVRHqb4XBnEm/8NTaCUMWNdk86tuyUUP
 r3fXPvavzKcXmkTN1/FMC0JWQXItKgqYrfqWfCvJRyZcyHT9IDrpo2lyW1TkKbV8
 O0+QRZHA9g7S7cPJ3NSYb/7LkiHxbCgvUW6usKflmqzaGuHs0olhOyFoJ7DCrzRM
 gQR0vA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyp8bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 02:40:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e4546f8c47so8552986d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739241657; x=1739846457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s5WY8N5ks8GYUyNu1nsdKVcNatvt1ZRhBofnP73+/Cc=;
 b=Bk5CbewuOYApmuKMFjZ6J+bfZWJWgYZpvzmEznCNtR9MIEZcJfln3CaXeddlRJuS91
 CPmxbK+n9xm4Zq6pnjNK2N7PpGb2XB5szYWWT2E9TvL5ZJM5kgqRp8ZyehtqGF4Ckk0F
 iV89V1WYzuTQq3gDIM4lVISJ2AFFUfoMdF4qazFzS2JCf7hNjL2jMa95xGWY1s0PLVvl
 p7RXpG2dAHFstQ9dywehmXKDcyTTAju2h+TbOLMzAmTO6p8jC4zonrJfv4hxzYSDLWRo
 woRS0bZPbJGu21frhGBkAQTwp1U65KTvbXM7cOaFpO3zDOh81KmlgEdtmyb7oCDn0mE0
 aiVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOdRNAUbpU/5HQPvzftQXvUOXO+JGL+vR43du3kjWSkoosFZJaKSNfQpOHAxCxp25qFlY7wIPqJqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzet0NnXNjs+aZB6q1KQmuI/Sl0mSTqEG1K/a4Rz4P05tkkOOIl
 IV+QXzOtWmF5t2F1gP68befVLOO02fyCddroFv+WhqLJFGMt+/U32Db7zkXzhhvrsUxXbVpgMyE
 txsZagW7fjbkz2LeU7weNsj0uo5B5fl0UcKdLDZdpOzyiaHvIIm2pZ99wtPF/UpJcJ4w=
X-Gm-Gg: ASbGncsNDoQ3Ew5Icc0GIEUgzC7dTMiEBZ4ltMBhELqTfbeuEaoOssK6RBYfABpf7LX
 An0dU6GaYrbu8AG0iaG+Si4SpneTXr2lJVp10ZDNVoWJpz3eXUtBXD9AMzlQbecwMeyuH859ujY
 aDiv+glp6ftQVe/1M3ZTj/axnN8slqf7i9QUVhsfNFJxVhplJs7T168QUYzBMqFOIEsrWvWAAfI
 f0HAlJ9YW2YtZFO3NY7PLEodZ6ZJlV1R1MZTtiBs7zz9b7RAqE3E0wvuLzOw/zTHdl7ceLklwuX
 42ZwNFrYX1O48wbe39qe3Vi2qmprD3X27yii+RuybP8U4qz/RDNO2QNK9AA=
X-Received: by 2002:a05:620a:24ce:b0:7b6:dc5c:de2 with SMTP id
 af79cd13be357-7c047c582c6mr862203285a.13.1739241657143; 
 Mon, 10 Feb 2025 18:40:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXTZRkXlf6H0uaJ0li29IfhwzaEgg+uIjLZ5thLqRq3AgGpVeEiHBLdGiJWI4c0EUhvnEVXg==
X-Received: by 2002:a05:620a:24ce:b0:7b6:dc5c:de2 with SMTP id
 af79cd13be357-7c047c582c6mr862202685a.13.1739241656794; 
 Mon, 10 Feb 2025 18:40:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de61830117sm5320653a12.6.2025.02.10.18.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 18:40:55 -0800 (PST)
Message-ID: <03df88a6-91d0-4504-b14a-223e55208162@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 03:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 403ViksuwCsgWo3tnNTsIMmzOSyz-oPn
X-Proofpoint-GUID: 403ViksuwCsgWo3tnNTsIMmzOSyz-oPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110014
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

On 11.02.2025 12:19 AM, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
