Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC37A7D023
	for <lists+freedreno@lfdr.de>; Sun,  6 Apr 2025 22:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B2D10E0F0;
	Sun,  6 Apr 2025 20:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLixNEpu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C473110E0BA
 for <freedreno@lists.freedesktop.org>; Sun,  6 Apr 2025 20:14:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536I1MWu017747
 for <freedreno@lists.freedesktop.org>; Sun, 6 Apr 2025 20:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O8hv9mePop8METDLs+nG1ezB
 BYJSkLemzhlRHzLHAPA=; b=bLixNEpu1IvONcIqZK/kVrOKgRLen8p3lTBq2jhI
 dUFySD44d0WTWUIZVnTdOJN8dp+W0Cv9Jk85np/wefr1OsSAEv4/5SKOBA2SXxdW
 h8G0o5cPbYiOCL3UXR8BttI5vUcETfyheZDt2+kn4YWuWRhp0+evPOLYsDHFWzYy
 cq9piUHaQ0TsGaI0F3XlbNq/q6lXq95KGHCYU08rKtZ6azNPyp3m8rqkGdJaHDT2
 ulEoJwz+RPwEn+W8I7WEsYx/kaCOLQe9eSkkOJBNTaofVUVNpLsF91y0a/SsMlhw
 cmFvjblyRJnwGvn7bhCnXQVOQwNO3OG+AqnvucNtWPQT3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3a90p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Apr 2025 20:14:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f7210995so664749585a.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Apr 2025 13:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743970453; x=1744575253;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8hv9mePop8METDLs+nG1ezBBYJSkLemzhlRHzLHAPA=;
 b=EKD0xSTDnLnpjA5fDCU1YRwntxySg+74vHEMT3B84Vq7asyuowvU0jQAxAiXRHOOJu
 V09az8GVT2XqCdNVKszPzhTAfurGKm00DftzRCKBluVEVi+CFcd3ADzYwhCkuzgqQPCr
 dZDpDygJ70b03z9Th0+WmwJmODtSXIGlhCDwWHI59Is5Imb7hK72SAaeSEAROivMrWvF
 tuSXichSaKr3RjhPhusP6luwrCx8zt4znENQAaAtcofV+ctsQUxyVRX6TMccmFmIT9Y8
 gZVfcwLw3roWTSuIvef9F9WyueCPaDcvf6fNlcXKGdBWTx/5AkiJuakWTFpHSzb5/P0v
 voGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXsTQWzTlcCQpCB8Zx2Cg89pQ3GIRyL5IdlFhwZXCrrz6X/37wG3o4Blacl6f27eNe66SDHvw7sRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFxY8pToE7CDSchO45NoX/NYKvjoJRk4JLhvmCDVSxGH/bMac1
 Piu4yJR6bmLFxGJEzRmr3C9SbPC2dRxoGFL1bKX0IbpkLpIZLBoDmVZZtRiFSoSel4Ddc3X/qFP
 +T84JDhooh4t32DwYvLoxJHa2Sj5ok/p0Bwo1c1RRUCzJUgT7OjcpePbdhAlWNEp1PSk=
X-Gm-Gg: ASbGnctFcBGNa51MlFcF3PDt82AG33iOAMquzAzap2nITLtM3gnBdOc9dkmtyI5V+ij
 t3LKKRx36Bylnek+4FwHa67wff0uiqYHnyIsAVqvruY3en6+Ya0YAWV8jhh3CkxXa7rl9NaeYqr
 fl3NfsDgt+6i1154vXdl7DY8Ih4hYOokNcMQ2C38nu+TnRg+33m0NqbBjPm1dTik6pABmXFULU4
 vwdMk4HNsx8hb+89HzBm6fpt6iJQcbixa+J1ooqwefFmru0+4Xox8Q5XnPxOMrERyJPpd5x939u
 7cCt1pOHMIY64e21jIwMKB521ByHjChi6YBUDZ2v0qH0Ib3FhC7k01b5/53u0c3HPFdlsXtDD3o
 9bXc=
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c76c9c0c8bmr2276342385a.18.1743970452757; 
 Sun, 06 Apr 2025 13:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6bE+uyjd5ifLK1IJUj1GerX4vOxW/2WADmTBo303FxgyqDrXW1FVehmfIGpQRQAfnLqr7vQ==
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c76c9c0c8bmr2276340185a.18.1743970452444; 
 Sun, 06 Apr 2025 13:14:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e5c1f95sm1043850e87.83.2025.04.06.13.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:14:11 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:14:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <ctwzoes6or6nmezz24t5tekb5ovxoh3bylqtiwjjvkcrz37xeh@hclirezl6o5t>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-10-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-10-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: Tqjy9aKheVWpWl1Y-KAEwEKrPznUjvtu
X-Proofpoint-ORIG-GUID: Tqjy9aKheVWpWl1Y-KAEwEKrPznUjvtu
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f2e095 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Qhp2PSjbNHdjP6JHm_UA:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060147
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

On Fri, Apr 04, 2025 at 05:25:38PM +0530, Ayushi Makhija wrote:
> The anx7625_link_bridge() checks if a device is not a panel
> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> the bridge operations. However, on port 1 of the anx7625
> bridge, any device added is always treated as a panel
> bridge, preventing connector_detect function from being
> called. To resolve this, instead of just checking if it is a
> panel bridge, verify the type of panel bridge
> whether it is a DisplayPort or eDP panel. If the panel
> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
> DRM_BRIDGE_OP_DETECT to the bridge operations.
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> like DisplayPort. This way, it verifies the hpd_status variable
> before sending the status to the connector.

This commit message describes two separte changes. Please split it
accordingly.

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 99ef3f27ae42..365d1c871028 100644
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
> @@ -2608,9 +2605,8 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>  	platform->bridge.of_node = dev->of_node;
>  	if (!anx7625_of_panel_on_aux_bus(dev))
>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -	if (!platform->pdata.panel_bridge)
> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -					DRM_BRIDGE_OP_DETECT;
> +	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev))
> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
