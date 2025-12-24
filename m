Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E074CDB821
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 07:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D824210E33D;
	Wed, 24 Dec 2025 06:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9O2NG6i";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDHvzlFP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FBC10E33D
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:33:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNKWNJ7700762
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cLIP10R5qZPENwwgn2IodzKT
 zyc56RdXNuD0KpBt0q8=; b=C9O2NG6i5AlJfVZJu1eHt6iMLr/FoEILDpYn8V22
 p2hbp2WScLNC4kgm46m2r7Ij4VwlFNoEpFED8k/hmML+ybl6HABN5JafRVaczfO/
 rrK3KvIpDf6Y5E2FF33gjpQkf9VQUA/hxskh293bvkfZkR9jAoA8CSQDbEka4IvX
 3ka7Qnz/HWJ+4Pxk9jtphVpdpASiWS1R8+IOtElCFPc2GnY/bFAjbrCFGUo/suNm
 q5JXM6x+ELSt5SUEg3y4hthzDkCXnA6kA+VWVEdVmxt2HIqbknBCkZTTqvaA3hIR
 PI0OJva9KrnUXgsRB/lzRg4HYdToUfD5qRBhiBRGFOl+7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jtuy1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:33:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so145576891cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 22:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766557999; x=1767162799;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cLIP10R5qZPENwwgn2IodzKTzyc56RdXNuD0KpBt0q8=;
 b=kDHvzlFPMUxYJr+MxmZ3pGtdnwEAE/XrNkhAWriRRxA84nlM1z0Ad6SxWvVyCdmsHi
 Bj/3zjmZHJS6+ffmzV+vcppGHIKyuTKZKdCc2IjkoFF8rDEuCBBCzRn7F7vsCXQrrpGh
 InNbtbzHX1GoWUj8s2oluml2ZcwIVPG0QfahNN5cH4WOlvj4FlQM6ob6R5iMqF+5HK86
 u1hB6nnDOQM8JhZwkfYUJw+hhPO/R7BI5CvjVsqHZd2eZATlshuvDzrCXPvIrCogqtGV
 NP7DHaGZEhjeIajr4NqLcrFtKfpBE3BWWeDHlNxlN2SfmJSpTogPM5FjlM4Qxr9ZeIDA
 0MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557999; x=1767162799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cLIP10R5qZPENwwgn2IodzKTzyc56RdXNuD0KpBt0q8=;
 b=GYCYpOkk+JOMWtIZINq40folEPy1mSQ4VGpL6eT9JdQ4PMvljWqHsOrVTfJyJNh9Mv
 SmQ0TBp8ZBtubqj2l+fMLrr8amXuvUFLb1ZOd1Qlx+weCY29hgLKQB3gzgkzpg6viQ5q
 IW7FDVfJdQ3QxeDXOjjCI0GnnKRmO6OHB8hKgTdFsPvicAQjo3lxNb4qG0CkqwYAZMyx
 Ptsm+pMWF+bdggZSSq/m8xWOs4us3Aj7hA+hUWj7JfULrHEjzZzle0bBOBpwUaQTj2If
 JAJRCnYXMm14L7TQIHCKeL6M156AKWme56I/73bSnB3D2mGwGU9/syunyi02dCM+UNJc
 /gXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUziLogUjE/wZ1kBRVz55lDP5VXvkNlKvxXOqCVFzxcRhAPwzhRKAS49eoj+OpnJ/l9j0zwpaQwchs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz32RpRZbz5oXwt5x3wEv4qNTgIOp70uwBlKTLVKIWKMVeZYf+0
 bNg9jQq6Dw6jjGMCOoYYJ07CAbMSgqolEencwRyrMyAFMmPdR47mzeM5y7jWLqYIOVUC245h7yx
 0TCWEooxj5rvBgyr6xs/HVQPF+yHXwjK85iWXTgv1MjGX1o7DLebqxHDJc6jfJVZmSVA2BmQ=
X-Gm-Gg: AY/fxX5feaJQ8cg41iCtwrWbVaSJ1ZlwuMoO6QB28jIsxl6iLa/BQffbFXfhINRUfBG
 r1MvsMNt2LlrYClLv4ICTVG7sy4GBG+4cd3qzwG7I6Y9DPmTLEsNwuUpwlBUhqCICC3PfgLWKgA
 UvrV/SKpw7gBn5nN/bsq3BJ+Levx3yUJOTA1qJzH6znVs1elfxcADG4Wj1WpF9rN4ApALA4hg6k
 GAOZmUQ7Aloi1DyMS8GH1J7cE5OYWqhgy+t4fn824N9qpIGIBTsIoyTWzdGWDA4R+5oxVXHtuQs
 +5zw6VvfDm8ExnjblG2K8RG1VTz4nL+RP9RPdZNAYlUx088QoKcs42R1EmCpcChFXRKAsEG414J
 Fzn80r68S5xH3iUUq4CQcU93rCrHA4NfSIGnX7PACw+Wf9gADk5Z12QrVZjr84VlVr4jZJ0AtZg
 VZtWmWgjTBWV3lVYuXrLSn6v8=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id
 d75a77b69052e-4f35f3a0de5mr302365591cf.7.1766557999504; 
 Tue, 23 Dec 2025 22:33:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGatEjpfm8ML332l49xMJ93mADIUv34etNyzL9APFRqVHNOW5FuGYf9TgxW4oQ4hlxq8wZsGQ==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id
 d75a77b69052e-4f35f3a0de5mr302365381cf.7.1766557999087; 
 Tue, 23 Dec 2025 22:33:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122501558sm40268471fa.13.2025.12.23.22.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:33:18 -0800 (PST)
Date: Wed, 24 Dec 2025 08:33:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <oyj4z6agsbzytdmfdxfshrakymdekrkvp622cnf43zh6cyebtj@hd2s3yragq6z>
References: <20251130012834.142585-2-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130012834.142585-2-veyga@veygax.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NCBTYWx0ZWRfX2UTCktpugApL
 xPOVqt9Y5IGc0bATG/9OohALhjP4NLkM+RZi+qW2osbf6tr4dGRKs0uk8sz8BOeBjzNq8oZEpzr
 qPha36MN8afUF/fTbYOwOVgFj0XdNr64yqOLI+x7JioMo5DdA0wTjK/qKLzXzvd/Q5t8o6kPVGc
 1RYalzehq4pinvn6azIzUOihVWhe2oCLKTCuvFtTVswgqCqlYqRcycmzWn0NQ5MDISlkTxrkjyU
 nU4tlhpwlCtrXRY3vroN/GDrWlVcvSnC44hJSdfkbbd9fSkLFg979dYpWbz38Kvn/eO8ABnIsEh
 gxmrihFf3M3kD/A9JK9WEadz4A7PdEYwvWGqdw24ja+x6rbLYIkRcOoxGe5nYMAdwrGS21SuTG3
 7WETI0jk6PXxGoHebP4KiLdKyx3wyx7t1C8EGCVWWN39VCsFTtYsO/h401rCuG46VtTg1xb/ZPT
 kBuJ5wyKT9kitKuZmLw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b8930 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DdfhrY3wd40uxI6BB98A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dNxagB0TsrD42-he13HQ8wttxFeQq6x3
X-Proofpoint-ORIG-GUID: dNxagB0TsrD42-he13HQ8wttxFeQq6x3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240054
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

On Sun, Nov 30, 2025 at 01:28:54AM +0000, veygax wrote:
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
> Signed-off-by: veygax <veyga@veygax.dev>
> ---
>  drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
