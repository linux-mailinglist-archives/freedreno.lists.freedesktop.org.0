Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C15CD6FCB
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 20:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663C10E0AA;
	Mon, 22 Dec 2025 19:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQrwaqUR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LF6SNAXO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0804E10E0AA
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 19:36:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMECKax1895434
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 19:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nn+s1homNWQHMLWddz1S2iuslw+Ts3/5yDOH/7TAz+o=; b=jQrwaqURDpMYcJ+g
 BSunj32sgTKzILCDPr2RUtA4nv6oA7xkzmsMN+BKPJNV6N07ytkTm8Kz3v2lPa2B
 +8ltcFOGUHtdEGMAeHKwQTs8qV1PiyuovZX6PsakWAYFBkLXMbFbtzlGPSQ38sAs
 Sfoj4UOQwWOYuNOKGCzxSNQkspht5lCyRUzgQ7F2t7gb70mPhd3KLTai+KEqRFyV
 mma7EZQEKqxao53EY7li/mjqxtjycMv/nNL4n1MlCuCg5PMNvBEvbfXa4g9YnK8M
 BH+8wzVbmTCuRMplFVyjal8/5Oe6WzbJSiZ+0QvxROLrL5VpJJ1BBzUpXW/HyGeV
 h0trww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74tah877-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 19:36:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b9321b9312so8649369b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 11:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766432195; x=1767036995;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nn+s1homNWQHMLWddz1S2iuslw+Ts3/5yDOH/7TAz+o=;
 b=LF6SNAXOY/XxYt8q5tmtwrfVw0vODMxrF+q6/CzdpexXtKrLu3kQ5nqqH5HJW6tl50
 4eEzen7mR4bkbg9ndwtkM7Cep/0ZTv47lhCb/8d/rdqy2oitZvOOhTMtbYiFVIprsKNV
 F1ID9Pg/lvuY12YPW+JOg1paprVWghUDazch5fdMfU9kvwtB13/XplvbXnTeKGM3pxL0
 x0h6/0MeNpI+HnsFhg0dwZklYrBQF8ign6rJGofvTHQE1QOhbAwzNVulKM+mn+V9H7A+
 zq2//LymNHVEUssmwcnTmpB4L6aomcH6aJNwfYXHyGFiYBCJlrAO8ZRr2C4hy/R5j/Qe
 rIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766432195; x=1767036995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nn+s1homNWQHMLWddz1S2iuslw+Ts3/5yDOH/7TAz+o=;
 b=kYYcnkyaI8M+f9MbKXDCf/WICxIuYS8+e6w0v/G3VejHmGzOxbzWDMh3XV9eCUJXjQ
 yu4gu97R7/8zLAKOmilN0Br9+bLfAgV0qK7lZnm3A5K2K44pWVhGsE//jIj+VqJMhFv9
 gaHnGUJTIGn3Hl9x/L77vjrEmzrb3vR2Ne0S2aLbYyCMNwNXlwHOhmGIENz++E+gNybf
 5u3laTYUUXBsgr55Tq3/iCLbVJSe4Bilaj2MVs6aZAnJdhlOUp8bappjA8+tzfZuJdtf
 t2UJuIMYI6nQoyipx4Asq60+5/xsGzjSV8F7fowIOX4sMDb1aTcgD/Kh2TugPmvclY+j
 uIfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0yjmxT2WC6C/3FcyLnaB35Qmn/XHWCE/yBwkjhRe2sEoEUDs69kWDKvTSyfqcnkhtx525/c1mRPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5Y+zDd8PoteQ80Rn2MyLQlVgIy1z4mbwppmN3rQjty8dMTHwJ
 U4TlTrfD361YHRvfI2m3e8/3dYpEYDL/bqHwwADR1PI2tUPpPNbHExzifSZnWoqAh1PBTfKdpsX
 NlUy2tll0Q2tDowXn2YR2seZscF8DsAGu2YNJH9e4wKfnyqED3AX7GLGlC+1y20oO01Q0NTE=
X-Gm-Gg: AY/fxX5x2ZRUEz1hS7EK9TZ3gPWksQi6vxzcOOyHBcAdlTSE9H33cFRRPbo1jJCshvX
 ueDwaELKv5sHFkJPZP9ZEx8MFR90G+5NkRCEYL4QH8PCcsyGFGCyHT0lNc2OgeGL0CEFaaNkaV/
 lpdZ/VxQriRAruEnB3jGOzZIx8fXSYiKW7iB979f4U8XzhTHx/RKq7yoCDUjVlyhBAfFHD7iK+v
 DP6GLI9wEGqVmNfmqnt1wn5Mc/a0sqm9y8Rmw9rHCooDzkfrEJi7/2Q8Oo61p7Lp0JbpgMk3X1g
 Vd7NWacHMlGoPq3KjUjWTUxhJtoriyYEZgyWx2+ubaoEf54uefGVK5uWOuQEHz4PY5HSNWOseDX
 t+1YitbKum6qEYfzKujvBSxMhOU8Axx45AA==
X-Received: by 2002:a05:6a00:4105:b0:7b2:2d85:ae74 with SMTP id
 d2e1a72fcca58-7ff65d7e724mr10088512b3a.29.1766432194757; 
 Mon, 22 Dec 2025 11:36:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYTrKbRHCEjE4Of6gK0jRIFuxMxi8T8wLXlsDgiw9a+p7RRCcbDeWEWpFFi4cgP/vYgY1lxw==
X-Received: by 2002:a05:6a00:4105:b0:7b2:2d85:ae74 with SMTP id
 d2e1a72fcca58-7ff65d7e724mr10088499b3a.29.1766432194320; 
 Mon, 22 Dec 2025 11:36:34 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.240])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e48e1d6sm8647579b3a.53.2025.12.22.11.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 11:36:34 -0800 (PST)
Message-ID: <0e592574-9e8f-4bb0-b875-3a437fd340fb@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:06:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251221164552.19990-1-johan@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251221164552.19990-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=69499dc3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=oy5nMm26i85I/VS19bmskg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dk0i7xQ4PQfej7aG6gsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: C2NShPQzgKJhzLni0uqQyO46X7BeSul6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE3OSBTYWx0ZWRfX6RQmMNCJENVK
 jrq4jTI1zAeCUtv29U4gOtfpeN2GTh6O63l+bYGr1kolzaiUoBZ/yGOVPfuExcvtCaiQ8CM5qfT
 nwC4x25dh1YN1++xxCoCbYEJaWWR4c3Xi6li3na6I9PyBWRDlBo1GmIMgPIsRIgmdJz+abhZd6Z
 oVEA2/8HWjfF2lDmW4l2577VBWp6+PbRZEpGL1OCJB7uBxyE+q1rhzTYQ+ZTihUutggGutWb1ym
 4ccBvUDxbNeh5pdUruKupENtZ5SYWbPmcjHfWQ+0sl0TwVEjL29wuRudRSAjmJ/mMKayfpjQThz
 /aoBMkp8Y0v+jcXGTWiT6EPudOYYE05Ivv9UdqvblGeeKWJoEtO7DVB2lhOLcfjZu4dhpCh49ah
 QiEX8ELY66XA7GWrW7grcwIUE+zYPC+nSHAAqCm6OJepy6JN1Zix+SoAj9pHRbRqLKxA6Xzivik
 HLnM0Ylh5I8FDpmAIew==
X-Proofpoint-ORIG-GUID: C2NShPQzgKJhzLni0uqQyO46X7BeSul6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220179
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

On 12/21/2025 10:15 PM, Johan Hovold wrote:
> The hw clock gating register sequence consists of register value pairs
> that are written to the GPU during initialisation.
> 
> The a690 hwcg sequence has two GMU registers in it that used to amount
> to random writes in the GPU mapping, but since commit 188db3d7fe66
> ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> the updated offsets now lie outside the mapping. This in turn breaks
> boot of machines like the Lenovo ThinkPad X13s.
> 
> Note that the updates of these GMU registers is already taken care of
> properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> properties on a6xx too"), but for some reason these two entries were
> left in the table.
> 
> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

I fixed a similar out of bound access issue in the coredump path last
month. This pattern indicates that we should consider combining the IO
accessors of both gpu and gmu.

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..4c2f739ee9b7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -501,8 +501,6 @@ static const struct adreno_reglist a690_hwcg[] = {
>  	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
>  	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
>  	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
>  	{}
>  };
>  

