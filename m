Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F0AF829F
	for <lists+freedreno@lfdr.de>; Thu,  3 Jul 2025 23:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957A610E8F5;
	Thu,  3 Jul 2025 21:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGrvMhL0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08BC10E8F5
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jul 2025 21:27:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563FiDmM032421
 for <freedreno@lists.freedesktop.org>; Thu, 3 Jul 2025 21:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B8EhHwVKYpVrPJqxIdjJWt6i
 mKVtstqw6FBfSw5Dfcs=; b=BGrvMhL0TDNFCs2LhwEFqzu7QOyx7f+cCW2mp+kZ
 0wLWqk+5N17jvzzu1Ejzhf6b5Rn5C4e8oNlufBfaxIEAiv6ngFCB8Uoui1q2PqP7
 larACg6xkL6YsWwjNraGORUubtDCBCWV/64XJ5Yg8dVetIFaNAO10I/WdIYmNkoY
 ZhvNxY5PnPdLW3+AYQrEYb8Ftu6+WtnUYzQ9zMhK3jSzheM04/qjbaVX2g97YAin
 KLdDNnC+7V7hW4zi1gbXwYC2uza1NUhPNB0YI0EWgdJczDQ/35bUTDtLe+y4gaVW
 7Ul3qtUlNrw3LTZ0km0RYzuTt3fjoGcN8jZ606Mm+xYJpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kj14g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 21:27:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so72507985a.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 14:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751578067; x=1752182867;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8EhHwVKYpVrPJqxIdjJWt6imKVtstqw6FBfSw5Dfcs=;
 b=Y2HpnEFtdmav6NVI/0fF7Z5zgOftEYPUSefIglsX5X8kibbzD5r8yWrsixFCK8c8ZE
 bgv3yBKmKsPhkdZznFJeYZGKI5j7YkAJsZzm4Z2wIu8eR1THxnPV8GV99CN4y7FPPA30
 HWWxAZ6rFxhRcFCLPCSMKnl1nnA4cy2AEOusT7s6uDvMFyE0GZv7Pxi2pH9isKuPYdEf
 yZzcljZBjC7j29ep//y5mn70DBWNbY2RlAGqqyBnyQ8w+PIjIFJi6dDhRmZKX48UdKWk
 AnVM/5rC0CDcAUWtsY9jARomL+jAQ8DjWV7wXKvIXdmPAQkAeH2DUSq6BrI6osPNdMcr
 mcAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9VxcsCwJTXQbHs38nGBGuzFzhsRo9aO6eMyU8ad8CzqJsVNyX9U1X34d3MDHpFrVUoHxEe27hsHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH8EZSNbOLbPzhXI0vTEwpffl346knAgwiSwey61fLxEybj7Ma
 iHkHZr/MwDYNjESfebZGe6sa5d3Nq9rgF7GDcd8uQ+TXjBJGoh1t3AT6xX4hftBKqAOtR6GZcUx
 m0cTLYYwYlqGDfIYzu5x4xPd9p+c7WYXaUbr66coOMTz9i3hVu0PCG/fEQdCo77CWL4Tft84=
X-Gm-Gg: ASbGncspv+c9KtyD0kv50mqH3HTex+2g/rhfPSsDNJKKcQz2szACBmP8YqF8BjQpfZV
 rMwIt0Xte5OOQomug1DqBhSIx3tU8glyad7EexGfElXSFU35VG1eMSNznTZvdGf3BqynRY52C8i
 GpUPK3ETwmVgrEGK952ESRkQxTF2YzP3oy/OKOgcAH2Tnw7sPhBFjBtdsqHIKfCaVVOXsqWOWKt
 2pjH1/AEQjqzGhHxB1PMUKP4xmJnyp9AKj5BvfK/5cKffbvEXoPaH/XASHD9QdjV9tUk6ZoHUsT
 mq8h28nZCdrQMr8S7nKPaRisOYzpTzAC2f5QgogyyPyGI5jpj691/EQH+j79s4y+lYksl3yLF9K
 9bzyLyF0ENxjl0IldL7LP6oGtQFG8y0NpSu4=
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id
 af79cd13be357-7d5ddae521cmr2890485a.18.1751578066800; 
 Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMJrZqqPZZas9zZzBzoVxAUKC2qdaPz2216jh1dVtgBGxiblPPM6KkbjiAzq0lqA6zcxM0YQ==
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id
 af79cd13be357-7d5ddae521cmr2888085a.18.1751578066366; 
 Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494f6dsm72675e87.123.2025.07.03.14.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:27:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
Message-ID: <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703125027.311109-3-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6866f5d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=nJWoAq30JnpefaDr-ZMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3NyBTYWx0ZWRfXxMzInvZmR/WG
 jKk6PFq5r4wOU4DKdvPnYV/+USThSNIwn/7prIB28h+g+p4boRyu3UaM0qdVrgfngPPIoUUnrS3
 rEK69uRp+4O8hOHyv84bu3dULoOAbwWNy0RuO0hjYrqqhFWNmDKmcmZ5TAbeSOcE0p3J3AkGcrt
 PHrdRvalCvnqicJteGI0vNeMTtvtf6LBvRHyepZogpQZ6dLY9B15n8TQTgwY/r04i6SSVUmeyRm
 aW1zm8JOpAWtqgZWCPUSVV6/ubplybcXpGySm9m5xuaw8CA70WnKG0FON+zHT/5Vi12VX3Ny+Fv
 J0b24KrmlFBhTSzy8++XTnCmYFnMga1dbS9tLED/XZz1R05SC8Md3KRU4jFxzeoaeWT7LF+1Ikj
 N1lo8u6d+nqPnMBnBaReNBz1nmxgYeG2XpVgDaaODCvDb74H2z9YEgtuUvGJFHOpSidO2uwG
X-Proofpoint-ORIG-GUID: YHNNnxzs0GEjs-3uoGw0QTeKjeTKsZ8p
X-Proofpoint-GUID: YHNNnxzs0GEjs-3uoGw0QTeKjeTKsZ8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=782 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030177
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

On Thu, Jul 03, 2025 at 08:49:53PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
> 
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
