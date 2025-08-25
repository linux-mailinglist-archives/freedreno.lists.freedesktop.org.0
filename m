Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0070B34E79
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 23:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C6010E588;
	Mon, 25 Aug 2025 21:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnEXUW47";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8E110E588
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:55:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGBovV020343
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cUqE7qCCjIfKy84Rr0H8Cz13
 kHS6QOxmkyR9AlwzF6w=; b=bnEXUW47jL0w7zec4aFNHejepHoQkNSHY7DZ9tek
 bzcbuSbguIBNE7yvx29VLJVkjPMI8RM6ndrvUJ5lAoxPtjANKfkoQCICsLcGFJUB
 5VW/vG1q1VKUjxcDaKk6vamrDriNQSXWRFb0Ws7IroTvrnttx4bKg4fUWCbr5ycA
 md3x9uy/CZLIQ/m44pVbLbAATU+vi8VwcaaYe7B3SB87xvnfRAzksN596wEqNWb4
 6y6tgUoXlR/L5KDO4G7xuDKVN0FUBTWdgJhKASYYS/uOuTWAvXVFPOmgOLXe7IJI
 uk9x0c1Zi/xpjBjVHkZNdfGTxFtNlu56KQVc6GU3nHv7Bg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thxk6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:55:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b2955f64b1so134706991cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756158942; x=1756763742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUqE7qCCjIfKy84Rr0H8Cz13kHS6QOxmkyR9AlwzF6w=;
 b=e7aLgDbL1Nqwi+HiMY9HvI4qafmOx2o+g+eb9WJ3Ey4NAnxrHMNOeEc88Nza33vk9n
 0YnlZmrcldnmk2IR6CR8n5F4qST1E62GR4Pix2Hufvm0CKqyg5HFLU/jds6tHm/JBs8p
 yZumTGMUO5k7BWIcO0j694ZDFhFZsJUmyS1nF2r9yEuefCYSyHnM+fmxXTfOibS85uVF
 H6Z6IbQy6pr0qbBkbZlOw/f21QgbaFiQ2fbDI/QfSzPY2hOoLt0NRCvBwvC4MH/mysRV
 5vrAAbbkUty6qvKGwFBAvYKlv0XCo5IhE4niZmwDH540t8Drk7Epu0i8LcqxAllEvi1F
 cQhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIvsj0aQ699c+pcI2KJdjEN9DQpKutlUpxSAr7cinzXnG25ffWUkeCN3Nukq87YpKdsNhXks4k0/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSrM+hIFJi0kV+PNOMBug9/PKhcZfqaQx+MAvr6P3PZBut+qYK
 mW0h2uvjOnaAvzQNTbj2sqVU8O27obL+011lDrIaIcGKMnHI+6W1eofcbON+b4L9PWxSqC0F3QT
 ZIgK++17ZPOJaRpwQO4KBDH0oHVNz8TLYcKLR8eGvzloajuka9W7SmCPqAT5ETV/lEPequWc=
X-Gm-Gg: ASbGncu4SZVB99Z5JTA60A6RN1lDE6biujH/rt09bQbRwMTSD1OnwqWqgMX7SJTdOm2
 eWmtObV1Ds3afCNPnvJtO3A0V32wM/Ridv/ODuWmCEHUkQpgIycklIUXgASqrH80jJtfhIWIzYe
 w1ylw44+lHE1UaU3f4G7aQYo/XOFpguUnDWwTD93Hzmd01+qrV7cOfLGhn61svOjNUB926GpCpZ
 FnqLrs9u5+rJTIt1kJJSG/7mrLbMnD267L8B6TsC5w4b6kAIYXQD4/vlX8NI9vvDwmPQOSJi+P7
 VMCpiMOa3/82s3PWAo0T7tftYoCLcqqLNIquleUozoEQ/O/fZr5dZ/Whu64fyaaFxS9WpIXGiOq
 +rfuSSmA2j9dcRKM5atNjX+yRtEqUy1himElIilpDLXU4Q9gkH0dq
X-Received: by 2002:ac8:7e8e:0:b0:4af:1bfb:1658 with SMTP id
 d75a77b69052e-4b2aaa196b0mr152453071cf.12.1756158942060; 
 Mon, 25 Aug 2025 14:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoMD3lKyx/+uaoF6/Udx3va33ITgDznogbeIupv27fT8xR/EpMcyEGrE5fvEV0eWAe2Y/LQ==
X-Received: by 2002:ac8:7e8e:0:b0:4af:1bfb:1658 with SMTP id
 d75a77b69052e-4b2aaa196b0mr152452801cf.12.1756158941479; 
 Mon, 25 Aug 2025 14:55:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bacasm1855198e87.97.2025.08.25.14.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:55:40 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:55:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 22/38] drm/msm/dp: Always program
 MST_FIFO_CONSTANT_FILL for MST use cases
Message-ID: <s5a6fpyqg5nybnnbrv7wwjvrsj44tr4cihcojkcfwmz5dc4r5m@rioxbgxvwayn>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX9PyQa69NRIPo
 mSj+Gqc7afsKsbYR+BKHlOuw3Pikrpey3PsaCv2NedIhYppMKtuNn6njKRl1N+kOsPlEasDe+gD
 bYumEG5mLVBt3iBHMDt8nak+wKNv1xPvc8WPSLNmtDQTA1FlNrs1+CYh7xZxJuM29kzVMGB0r/J
 HnN/SxAVfTB1Ks02FmHDqrd1geedS11pluK4Qzv5MogVhWKTreICpxw/Or3Py2Wmcn+ZKNKki/N
 emMaB/UiqeItkR74mp6T/qmjps7UwYL/m8CWVPKCgczoJb85u/3sKfnEmfif+m6Nd8qlYIgCg5S
 KCYUGGz2b6UUKexCclcoZjTnG+oOlgxzt8WSJgdZ37MN7Gjv/ry/iuEHtv8iUjbTL7GCcCCuF2x
 o1sMJ0E3
X-Proofpoint-ORIG-GUID: K5kqNVH7OcnLRigg_7IRPHCEuloU6I8T
X-Proofpoint-GUID: K5kqNVH7OcnLRigg_7IRPHCEuloU6I8T
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68acdbdf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1UWbhTYU8iixJmD3m_gA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

On Mon, Aug 25, 2025 at 10:16:08PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
> always be programmed when operating in MST mode. This patch ensures
> the register is configured accordingly.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  3 files changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
