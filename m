Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0895C01079
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 14:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D9410E3F2;
	Thu, 23 Oct 2025 12:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="byzevInz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E731C10E3F2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6xokS007442
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5onFcSVtjASenfWYLyuXz7Ij
 aEZN0TDQOoqBl+QFROk=; b=byzevInzK3g9LUPjzm/e9hwxr+VfC64JLQt+UMkY
 xX55uPVmpIAkfnyLrD5ytJwSUlu5RgRuycTFZvu74Uf48yOs2eDSpi9BJbSMFH12
 qvnY6/dbeNVfHyU/EBWerTP3arsUgCXFSXD8ZKc2KhqBSCQWjUPlZSW7MLhTwCR+
 VE0/ozm9cGuQRGIBMaHc1r/dbD0RL7JmUdimgR0tFltGv46vWlYAO1co8tSHGBk4
 nKh2j0qAgU1QOXxdsMfzEIb/JjMCxgyY0VVq7RuMLiKNkdhwKkgo5AZKoBO0N3SR
 +f+J817Ms+IkI3IXKatVU8VG7IlEo3tATvPHOLVnuCViow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3448d74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e89265668fso21999561cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 05:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221682; x=1761826482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5onFcSVtjASenfWYLyuXz7IjaEZN0TDQOoqBl+QFROk=;
 b=qQ0lmTvfjsOIaAujC0mlJNJ1l8dY9Ny7Fll8KIj9KRtDUPbnHY3q3uWtjY5iDzIZpx
 sYX7qx0mDGaAbk5cKAd5EEVu4rPTrKGUdCPJCasCa2I08SC2ZIP467pH2/iJFb9msdBQ
 tVdYylkW936ELmuApY3Y2T0F9YaaYNDH+Vwwd45Kgoa5MO6R812/Cumd6ugktTjW11HO
 ABy0pVyJHiICNiQbTTRAr1itpdIF5bA7tHNnV23GK20HV+IUX+53bsNHXUo/SH6R9m/Q
 4AAxW1sVw8w6UhoX89cwOJ7w3uJ0rIC9J3K+xmFUOvQ+Yz7XMapNZy7wzkQM4XUimgOy
 Vyug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0oJVS3c+eQSUhhtKVgKe670SoXS9NfvWKzEzncHZu+2uwxjlRBvrX9kjtH7VfDn7zEVrr3vYwEu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwYb7MOyn2BWQXRQlnT0TDKYcErMLtQjHzItYoKsWTe77/Eh1y
 RSaqGL6sH13WL6FhfRQMXE8yGJIxjGMFW2yKa1KQiPODpDO415OhnfCpYDK0RuESmORSCKcDUNP
 ZRf+vlJE3kuzwH9tXdAQu8ZSn9z5QwZVOy0Oa29L10gRHrf3bEOmHEsmnAjK9yW4OpyC2x5A=
X-Gm-Gg: ASbGncsDm24kKH4s+epjgPiZTH5CUFcj/vybd3WIq7C6bKjstVhPx9fsCU7dS4F45LG
 41qx8zZhrck4U9m22Z1c4mMDvqBpn7D4IBOh+4TIIh/LuTFWxjKCXqE7CT77IndrzzIk+puQ9qq
 hBd66ZgnVsXfEBLVRHzHnFIlNt0UQal5vnCJmAg1oBkUNq+WrkbsByuC+YgJ3SNRmKbfA2eeXu0
 ket83KRScXgMGjZtujs6ngp60h7oD5QSbVSgwL9D00qhrrA4z4AgHPtFNzuhXVrIY3MtfJS7mRL
 XlCXFIpttqTzDZsl24l/iJWHvaSfozOnjP8R0B3EJOzmsgkRoxX/SVB8aXoyldJ5U/WC0nrBX0i
 2bNwk3HkyUJTY1XZ3UcPJSmitU3PWPEhmT9T2e1eaRxFsCrGBuPwDPOpa8PW93F2OHld5fODGf0
 2aMHuajqkY0J0N
X-Received: by 2002:ac8:5ac6:0:b0:4de:cb90:dbe4 with SMTP id
 d75a77b69052e-4e89d393b93mr314967211cf.66.1761221682041; 
 Thu, 23 Oct 2025 05:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESzd2NTnn2inqqoUmN9EYSM5jAuMSd0Wq4bXLNw8lQEUOtptDq/50z8lDPp8MEtECsteYIdg==
X-Received: by 2002:ac8:5ac6:0:b0:4de:cb90:dbe4 with SMTP id
 d75a77b69052e-4e89d393b93mr314966411cf.66.1761221681423; 
 Thu, 23 Oct 2025 05:14:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d2c32fsm702012e87.89.2025.10.23.05.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:14:40 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: V2x6EbjufykPJjFSwNPvfUt0jwOPvCYf
X-Proofpoint-ORIG-GUID: V2x6EbjufykPJjFSwNPvfUt0jwOPvCYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX5wvNPBAdxWqM
 C3mC0x1B4f30yqN4BV4UGo0Emec1FEZSukSFOGfsXtH49GQMftP/Eipu3TQdu6QAsH95u1kur16
 EbgpfsYtrKB9XJ5Cfmm/Uo0ovZqT5gJw87gab4lDIPB3wyqu4mT/QHLs72ihftzdCVl18eZHfFj
 wTbmmY2kHJUcXlUAVfxkthkQzNlbpm2iNmuIgD16WkWHY+VvL2rpelpBq46jrOa3eU8ZIT4ZLqj
 GqBjXzS6zy7G86CKcJiDC2nhUoDgHwA8i7jIOQAMJ+fhtWf3OJxzaIl7dcQx+IZQalhqwlwQDiW
 Kuvsm1CjQm1ssh3ss7avyzq8jtfqbkHR6D22Wv7tD8oAyVoKziHrDPEzV1t+U5qDSoZ17AFCEqo
 bNur3GsDWsNnOuzsE4V7mVOH7x8y8A==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa1c33 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-jZqwlwB3PUYXKLUuVcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> index d6a37d7e0cc6..7eda16e0c1f9 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> +				    1650000, 1950000);

This should be done in the DT. Limit the voltage per the user.

> +	if (ret < 0)
> +		return ret;
> +
>  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ctx->reset_gpio))
>  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
