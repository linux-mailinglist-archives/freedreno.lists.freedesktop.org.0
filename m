Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16439A91993
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 12:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E4210EA95;
	Thu, 17 Apr 2025 10:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6Mwf05P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF4110EA89
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 10:44:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lLQa027350
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 10:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ppWs9/kYd+Q7yQxJO3DvRjoy
 waOVkrLIFLA17j6xOGA=; b=O6Mwf05P4kGfqD5bTvxKVJ9Df3yOj2jKW9796z87
 3DAhnrNJM+2l6xeAAS+jxraUunychdF+WIlUHtfpu8BNy+roR6Ca1rbImIOH8bZM
 2cfq2l+9JQnKvEStXnJuUy0Vm1CQGHp+ArI7+iK33EpW2y/YqnGxHcJlCEsY/6fD
 LECvHVaa+xnma99jzj1liXPReQpqknMfpyq7zOt6CWGvu3IXcAMzO15Un2JVxb6+
 6rGffgz87Xx1GTXHkhqWcakd43A9SDZmsY0UIJI0zLxOclQ9/nNHSFdg9+fxVW3p
 E8g5XhMFTlIfJoqctsmUwTrk1am0cQ2FiQqlIn97Md2HDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjetcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 10:44:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f99a9524so18369466d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 03:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744886651; x=1745491451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppWs9/kYd+Q7yQxJO3DvRjoywaOVkrLIFLA17j6xOGA=;
 b=RUV334sgVwv4o88qZJg4/2wirBNQbzohjVgjpUE7Q85r9YVFcIZuJEaJL0YW2ittXx
 jGXDYlgsHxBj8DnGNADTU6zqKJ1ndzUEgS34YX+0wvG0qZt5YggYpqeQn8gjTOv6DUhp
 mk8LDn9uP/F+0CwzMMnEluwk6gUmAv7/FTXFKoZuw3r9SNSD+7wbUGFQV9rINdbONZbJ
 rwfINqiSei2RHzp38eEm6nu6qvYRhudCBxXY9LPMXtL9alpb/XnaUVRaGdoCIM/BFlzB
 pyStIIa5Ry2cmjODd2TNmtUOna3mhQ3+8TU0QAAL/uC1WlG3utUSkGY7aYm40od2aQBq
 FoZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZkyYtLUCWhwcyN+7UQDUMSOAnXEwOk89xMc1WYlGixya7Yi1c9ywBzMbr5it1M6vOw59Ivn3viqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQTJswvwlohoqxbbFPBtxmIIfh1AUHFyIMtxWCo9n7JE4PaWnb
 nljuiCtCDkwoZanwWcedv8cEka3xxH23ZS2UtxOlwiEnOWaoB5mO8H8EkJqHUosUEaaPxNEw44C
 Uwz0VDvNYcnK/bpHUZYasz9waBYYv+uD+njuw7WzDlE0UH3LN8UjcAh9lzWdxMblg7D4=
X-Gm-Gg: ASbGncsb0k28yGcOibRVK8htP7iKcubGH0Dpslw/+Oy3ru+MIxgeGZKOYX54Pi9+kmC
 qKUtUeDS97G6Kx9WcrAc+tKklUPY543bm50aKbr4d8mRzIAifVk+sK1FYxW9MJQy3JSTsmwp+we
 T6YLJtb6e0IgiHyBqQvF6QDEY9FdbpPdAcKYOKJz2vZRlvrGseyBDQw7TB2J40j9Goher9ngErS
 5v0oWCh0GKE8fMk6w4gV4zwLaMU6Cih2nBfAyJjaHhcT1Fy8aZUTICJiqHfXs0BhoEK2o+sXq5Y
 zSvrdw1i3r3nMSDRJYB7Xjgv2/dJv+/8gxDHbwOchENWHoxkumkFWwLEmHK1zKyHvJzVsut8c1g
 =
X-Received: by 2002:ad4:5766:0:b0:6e6:6c18:3ab7 with SMTP id
 6a1803df08f44-6f2b2f5fb3bmr87154716d6.27.1744886651491; 
 Thu, 17 Apr 2025 03:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqQ/KLp/IVSmaGp6NzSaGXvhrK11Hurnr+RjFchMqCJQpnKTKhboZA08HmNSeTGf/pdOABqQ==
X-Received: by 2002:ad4:5766:0:b0:6e6:6c18:3ab7 with SMTP id
 6a1803df08f44-6f2b2f5fb3bmr87154306d6.27.1744886651159; 
 Thu, 17 Apr 2025 03:44:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d510914sm1896321e87.196.2025.04.17.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:44:10 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:44:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
Message-ID: <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6800db7c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JL1rjniFVyafwILi9_cA:9
 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kEXImkeenmAq1v-sqSih7zb78yVOU-9B
X-Proofpoint-ORIG-GUID: kEXImkeenmAq1v-sqSih7zb78yVOU-9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170080
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

On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> that supports hot-plugging. This way, it verifies the hpd_status
> variable before sending the status to the connector.

Does this work if the Analogix bridge is connected to an eDP panel? In
such a case it should report 'connected' even before powering up the
panel (which might mean HPD pin being low).

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a32ebe1fa0cd..365d1c871028 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
