Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF00CDCC68
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F44810FF77;
	Wed, 24 Dec 2025 15:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="os+ZvryB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWuVfnd1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0C010FF7E
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:55:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO8mZO81206461
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=; b=os+ZvryBbLSlKgIH
 UG0FOlTmbaja3DtCZCR7C5tqhw5vrpyPiYoHh0rK2EApAtjObYgCfMugLMUQY7jK
 gNLsoFDJMdyXKHhGFNdfekdDsqagZLb5szh3mAXOulQn5IjXTMa/6RpLsFwa2nVS
 7323psaow2kKPSt2Dho5VS2j4P1tbGlPf08wA0DDrTCN8d427qd096hj7E5CaF+g
 9Ojx4+b4yg8IMlBL2VZWEK9oSD2k7Y57RgUBff/VZr/qNP+aFKjtjllN51oEWdob
 +TbhQr54c+SI1a3/rFxHk/Qwu7xSZKaHxG5WiSJlt2u5qqy0YIMbB9wHuQDTixWS
 HmunVA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r2hr0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:55:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5e408360d6fso3764704137.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766591758; x=1767196558;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=;
 b=PWuVfnd1sN0qCWKkdKcWfmdb0hm6qfnHomRzcc9MvlziNP2oYLEkcTuiW7Jx9t2FFw
 P9Vk3tSVLsJbVrZ9qt/8dCedHONDKTRZTB0XPaCR1dUyFLADkmgnh4zsF7qm28Gi7vAU
 E621OEnDqxOb6lRt/taTyKxp3ZqwNNUNacMMxoi1pBJqH/EgSa8rylmx6ODep/XKqs1c
 R4ritO9TFNfTs1Tu3j0vjik4wtRVj1kyWxsk/y109aroiZKWKrcf1n1yepQPzrE3VK1w
 yAZ7A9Y3cmLGgFQqldF8P+hWN48GGe7OjmZFcQNSS3V+2wb1EDY3v2B1vH3xq2REfkti
 on/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766591758; x=1767196558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=;
 b=SgAIqWwLH8YZB+0CZ+uBuRCdP9OKNr7ImuQLABWVawzheFnNE0joUxPANOfXU+se/n
 W1MivUmIZBI8qTfCIylA9EYLPM6X2qctvM21zvpxY3BH+Hoijy/7W7jC+umVz9hN/yq8
 GBeebJvThuVRUF7j3x6wXBw/wX+AO7rh1NXniSfRQMJbaG6Ho4Cql4wAQ3+YwNtmkXMR
 V2iOb5O+fHAVqF/W5R/UwhjV9J+LfgeAMXCZhTDgCC7iwmc9ACoyOCUk8oKnWpbY4tdW
 ACaE4WdhvG2KCenSk2HXbO4N810SifndG66wVGAUdIOpgXHOg9TC/yuiUBhhajfgUV0V
 Znlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj8SPpX4yeLqxKCeyjAbeNO5KMxITEoqvymovxLs5mkeYRBx+VcgMDg1U6mra+h4fbBAPQOAeOJ84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWVH0dpQ65UMl6GeZOhjHrou8v23MMWguwID6u4a3Db0GEjbci
 Y8SrAi6y3LnDe/ZRXq8nfX/VjuJnyuKvd9L/tAzyuxjqLMIWLHYv2Q/1O2RcwvFaKve5pVJvINe
 JeZ5km5PMGJiYJTeuY/+M4UFcXFluKO5KcLgQAmiQFaY8RBJXfEcxpkS/OV9/10rUtp39H6U=
X-Gm-Gg: AY/fxX787NsEu4KPkBrPnFJC5Q5KA74ZDoIKp8o9atwMWtEws3n/EkmWTwFV8eOs5q3
 z5mLmB2xClTBQ4s1Fm/O1MvX/JWqwo6KGmJNRGPNp12VgkFqMVUmCk8fV9BD4HP0zSdQvTSDCIe
 HkIHzul1tjEmD/1Z0QdVFgahiqv5BJSilGKN9YrhqvSGkHfi0iG8xRfVqE5jzeAKVm4suygpKcr
 lO7xVV2dg/NPbfnME8hqP4vFbpl2ABWe0VepTB/cT3HIjQtf5fasUELRPyKP8WeVqaVJVUIFguY
 Ileq6rQePISyFGZTjCTedhcVxRLulJBLUGI6sp2v7jpLa8XXngyNZVAcGR6fNu25n0Ny7TQeIeL
 xzcwcfKMRH5SgT8EMALzC9Y5X7VRvbkTPK4n/QD71yp1Emg6q/d07X4mLlIPmAIskZidLaaVaxL
 lK3sLrGEhD8PpJI4FVU3nWtP8=
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5eb1a61e6demr4946913137.4.1766591757736; 
 Wed, 24 Dec 2025 07:55:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEERFla3B6dDcluPaHksW0ojIo6+QZYY+sSk/hQdyYhKIIJtQbahJAM6fM9o+u9/xtIUoAfrw==
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5eb1a61e6demr4946909137.4.1766591757260; 
 Wed, 24 Dec 2025 07:55:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b360sm45158661fa.28.2025.12.24.07.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:55:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, veygax <veyga@veygax.dev>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Date: Wed, 24 Dec 2025 17:55:55 +0200
Message-ID: <176659174997.4059120.16151098492056445076.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251224124254.17920-3-veyga@veygax.dev>
References: <20251224124254.17920-3-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MptmooaRFqlREkvAYss6ggakXHTXZtpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDE0MCBTYWx0ZWRfX1aMHK/BuL+nZ
 KWoLsu9zmU+IMXb0rW7Ludd1RDKt9JLCIH9XTY66WwZ5wBkxCTuCeMzwot0B+FmbZM4HKZhj9os
 CVm7eVw6fAib3/ILdxsXkC+7q98FmeBfBgyUr4hsgmrI+puCSpPsVfOm622Nxj3z5He22nBHf22
 3bp8r3jAI6424h56B3SoPnJY4C+74xLEGKPYFNHnONZD/DJJ+dmqj8RDH8h1DTj2TeLllmh+0Gr
 JDcojHF/BnOc0vFtJWhlZIjOXX1rgOxjGozY5jix1dyAM6hqnavecdj/YIAaNJnu8u/0JvuChgw
 /zKIsuTuECVmSJk0f8uNwNfsroQMrWqPpDjMzEv2SRt7DnfN0nz1AYUaxiKrItas2THDuQ+HFfA
 SenPaxIK9VE6b6O2+xb9HUO/YjL90l/aqYcGmHQGaHo2y6/mkkJ1A7SVCug0k9R7HMqbGG2Y7tK
 p+PbmIWo3uH3lEviU7Q==
X-Proofpoint-GUID: MptmooaRFqlREkvAYss6ggakXHTXZtpB
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694c0d0e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Sr6y7Swg9AFsQnQ4lA8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240140
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

On Wed, 24 Dec 2025 12:44:22 +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/66691e272e40

Best regards,
-- 
With best wishes
Dmitry


