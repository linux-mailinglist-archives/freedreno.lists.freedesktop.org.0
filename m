Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B139D283C3
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 20:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7889910E7BE;
	Thu, 15 Jan 2026 19:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUsztqgQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/qLvMnV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF52F10E7BE
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 19:49:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYMUx2866856
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 19:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vNyvDLfAN8WwlT6zHodw9UdF
 0NznYHtN6ODgBj8iUn8=; b=XUsztqgQbuqTtAauO4BbRi703m24+pKfKphDtgHJ
 yrnswfowqOsQGwwzimVC6p9+cCb22cHJsJBcVGJRjEKRxzCzR7OE+JX4Tjk/3k8r
 oZJ5Eqb/dEyP5YFDAtePk9fB5wCxmgqCjbz8pHVW1Phn5WkFmLRuvAt43UMt6jom
 8AYQUgvp2s3IvVcBFelprbnoHTLKa9/MhdCKCcxDsGJa+ZLp647w0BmxRQuBsvVh
 BG2eCkHtp3bKsxF3cRtFYwFYU9SCtt8cOGex39HIGHfuMXXHSsHXAedu/uf6aV6u
 5dV58bqsA3+rGIxb+bM4L7Jah2hTaUB3+G711eGzrz6ksw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2j92u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 19:49:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6a289856eso167696385a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 11:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768506592; x=1769111392;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNyvDLfAN8WwlT6zHodw9UdF0NznYHtN6ODgBj8iUn8=;
 b=j/qLvMnVBjcN0aAeF5OhxyBvpn61gWx1tH3vQhJvu1AxN2kXVdVLK2PvQhy1FjyfqV
 wW1aXR7wNNQWLTCZSWgGRUTrVywZhp+NX5icutycNVD/OqpHpiI/3y6ZmmWhbTM9SBeB
 44JYFdM3Ho2XMej+yJuHagJqjwzRvMk0UZEgzyX8KQxxq08WX+Vh5iblBeGldhF8c72Z
 hs0iB3shvea2gIQ4aeoAYtXlU5WW0lTX/CV3Qbb4IX8tRcnlY/wqAVb0PRvRjgHjitS+
 G6uM4T08Yc8i16dLQxOTUohznHxF1JYu7UmQRXuEP5c2hD0gDKMoadKC2FcHGaiskSL7
 68hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768506592; x=1769111392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNyvDLfAN8WwlT6zHodw9UdF0NznYHtN6ODgBj8iUn8=;
 b=eBuwCS27l92nvZ3XQ3lqmsH6AQl/9zMFrvaveYvU7w+KWl0TRgMy9C5ukfj5pZOdxJ
 V4OWNtTifeXM4mMGPF+cttSPp9SCZLZggeIK7RpsGAemx+1DGiCsX4bsZqKzeGLJhp81
 D7DP9w360ykNIPZb0gXKKo/9JlPxW1XYEaBkcinaRlUAWN4U7kryaHd/PJQiYnskyQFo
 BeleyqJJs0UkhL3CZnv6QTlfPRQNkOHaRf59uHV+Pm20hQmmqqu7EkjNvgRGdLU0FSq7
 G4RuxMv3dt8u9ZA4UIB127XlVY61rRGFi0knUgBV8WSRp1KVaQY+w5sGpjmjPdONeI6g
 jivw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXf53PUelK7GZj5UmhdZPOYmZ9+dQ5ewanbJs0desw+frLYMOGWm/GDR5k/lraX4CXlxisa9ahpSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9yA5CoYIPxd0Ax770/qEAaYgkGycuW+Z/qMJvJCCQOBp27UaJ
 kr1DGNsRaPMzjXXxK+abx2GwJE2V43vPyAJSv8ONTvL0ccX6PJutZh0Kj3hIFCKUukCROtjV3QN
 ZJt2O9X9AItyv8QtqcRRk/ZZh5WukS1kXOnubr9GWhwgTlw4Z4Zp4uBatkZCKmkMe0P6KgYM=
X-Gm-Gg: AY/fxX7x6PHZo/iuBEAty5VQhqNeAesP13ay/zv0Izb+Oys7BWt8KX/RVJTggUCXtfk
 fFV0NQuYFrZjuROSIYQankSqXVfXnc0dSvQu5IAg3ZL+Xb533eGwIiSJA+dR06zDb0et+rt3n64
 mDSOYQGlO3igvQnM82qBff85Nhm9tda/lORW0FYHAb+g+vwkWQeBTyiwnWrBahbvs7GYcCNEezt
 C8QXFGtkEnAYVK68bL6VqKpXhStjbXd5Etp6yezjpA/Xr3hQje7soKY6fMCKgZ57UtxJCTL8ao/
 UF+GazGrVCEk3OojJtmYWEptVSzyfdzf3FH6bOE+6CAaATXzspiqyHwqHoxzP5kp2s0tj2r/WFt
 bO6wRPUSYQFmYiAoMSn3LA6qvl27eOzLR5x+MduJDcAXC8h+HIjN7xB1f8c+4QaEtlN2lAuCRgT
 m50LkRcqu0mCO7HvFx+zwNqBA=
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id
 af79cd13be357-8c6a5221655mr223791085a.35.1768506590642; 
 Thu, 15 Jan 2026 11:49:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id
 af79cd13be357-8c6a5221655mr223785885a.35.1768506590140; 
 Thu, 15 Jan 2026 11:49:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39c150sm102366e87.78.2026.01.15.11.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 11:49:49 -0800 (PST)
Date: Thu, 15 Jan 2026 21:49:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <izgoqm4e2ydqrelg4sxc5a4ggnqzqei66m55ds5wvvfbhkgyat@trzbm74n6ctm>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
 <20260115092749.533-11-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092749.533-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfX9r/4Z6Wu+eu8
 OQztdpeYfx66DpGAZsTmZ4zOjX1Xbwh4zjo57hqaap/LAkQCKx2m7zB+rH3F7rb/sh71F8o6IWY
 iXz5fnAJCxoTn/i/hUs6JYTrHqVHNT4ZrbblxwevMU7PLuH9v4ze/E//iyuwNrg/FTBtMTdxWqm
 8nArD1OEYTXlYV5rbD32y/VdXYl5ndF1+SYHp0LKk2fNDzpI1CIF+tnNZ+x7AkZKkgeicKI5hcP
 csalrEJj28EwbZgorDgGO3CAZvQ0kr2mWMNxz9GAbY2vJDhxqu9nqYEDT+0P0Y02DIvz30L82Ge
 f/uJXZTOTeTSeF8QbWU/uKKumvprc/Ht/k2ehp44SqNfv4tnE4HzkPdXx8fBx7iBdXoYK0jGtDG
 SAtDGbnZ3fe+4h0fV5n3K7Glpq0wu3YLflS8FMsGU9K0JTl8wiSl7MDtWnJWm4fiZfySZT7eltz
 O9hwvehoQ9vjVe7Oe3A==
X-Proofpoint-ORIG-GUID: rGiipyXTfD1NpUUAQNFssz_cYIPTdf8o
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=696944e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4dFScLpsznfeEuoa3zcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rGiipyXTfD1NpUUAQNFssz_cYIPTdf8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150154
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

On Thu, Jan 15, 2026 at 05:27:47PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  7 files changed, 371 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
