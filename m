Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CDB549D9
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 12:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C110EBFE;
	Fri, 12 Sep 2025 10:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ez1cDXbS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A9C10E187
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:31:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOBt010914
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QYQVjSVGI7fSyP5NPLcxC0Gn
 NWMprT3G/Z6o5y804gQ=; b=Ez1cDXbSvnGemg8472pZ8bhDQSW/4Ft8Q83R/893
 2LMiB8BhNhqVTzcLqTFOdPPzOGEBduIjUcmertrhXjUEwFazZ8uDN72wdBV17WVQ
 N1IP3xd4EzB6oLWkiiA0uY9D3WlGRnKQhXnOmECOHgeQFIT9qcKZ5aoBLm3xiFcK
 D+d1nyaUn8T/SNIOoVZO6Dv7YJUi2wuXu+p8yn5Ui7LmKx7tNTArTDBp0+OfU3kj
 emw5YhBiJ+Oo3Kqik7N5C5FR1Nvb/HHQFGiG2jJRmnOVbC5aTQJNh/VPpp7fJ2K5
 3WK/a16Y6uK50vMN5E1UFSsc/z6PliVOMaryGGIDqb4UDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mb16p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:31:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5fb1f057fso23881081cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 03:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757673075; x=1758277875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYQVjSVGI7fSyP5NPLcxC0GnNWMprT3G/Z6o5y804gQ=;
 b=S3G4lyXSZEEt/LgPG466s0oZGjCS7aQsfVYIovleDuipesZCOt6NmS652na/yaXX9c
 SuQ6BE01DDJuS3pbYe8BuYyRp8UToWXLkKMCpnsJwBQkgQUr+CbHXUJVYCoPWiDBV21a
 PdLEWO3lHC77eRdqpGbMlczP0NuZ4exhOzuPYGKj8nqNVkkxyxWM5BssWx7Vea9Gl+Ll
 5NC3GoNOonNfO4e9EejNDVq/NeuiL6/ORc3Q0TKd1FoMI9GG3n4t/GX/8q1DcQaNuhv7
 uco3gOuxl8UWkL0UdtnOPpKCpRlM0P9p1COuYdWysvWRV2osswezPkzqMnAgZTaMt3dR
 jw+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrcmnp62iv4zjZn9X9exSoeb/gyhLg5pLXnjf5GWzpdETY34BIlmA9wcjmn6LuAkPb8pVkRxTjHjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhjWN4ad/fEPqVuqdVMNkyFLX58SFIhwwqWJbNb5Vtyk8MFWbW
 t4ecOhKjZMwbRzALUcNqG0CJJG9cv2o/BhNVh6r6G3bY0vZtcMWT85/LqNK4uSjFN0CYOW2CR54
 nGp/Heh/XtgS/oxEcrIO/kP7YIlFWLR9R/qnEYU4fQMiOUfJ2/0s33BKrY1ym++qrjDUEcT0=
X-Gm-Gg: ASbGncsezX3OwFmrlO6Z/cEvn+7/5lMcPAxLgo0PjC4TgzSmL4s63fY9smM/z+K+bBh
 TEnFFbBQTUr2g8wxypxQX64eeTUBg9XVQxY69DUyBXqfjzB0j+erku7VHI2WELe8Po1/W7MEHji
 lFuTWkV/iYV3lJip/krEGBXkj2yHzm6BD3eSaz2k1/OabGgd/KAC2r5Y3sVMQyb60Z/wYpeCcVf
 xTomyBA+4kOEQwxIEBveFqxgIl/DK0yp1wfjX2HnRG+/Z3S0zN6DLcvjDEHcAE4COVpiX3poaN5
 1E+/HgiEJO3ZSK2KYLtH70SC9y0u6IOcKtNWufp4mOJWDSX2xWdwo5qnl/MdKgMCu8jUYdGBUTs
 sut2CL5er42wGqmwFglO0EXQLYhysodGUNMiZtFNoQlbj+oC2phnX
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id
 d75a77b69052e-4b77d0c8726mr25974541cf.65.1757673074767; 
 Fri, 12 Sep 2025 03:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlmYG3GvVCPpgbJA4niCY20ubvFQsgSIGszF/TZGTRPQ9P7ipXCexaQtPdOTizRtrNWqVY8g==
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id
 d75a77b69052e-4b77d0c8726mr25973891cf.65.1757673074110; 
 Fri, 12 Sep 2025 03:31:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a3464bsm1032362e87.139.2025.09.12.03.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:31:13 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:31:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 10/13] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX94KB2+u73mYv
 YnlrP/GfP1J0UFtAbAbeGcNUHiYm6ItUDpATueknBbfr2iDm8BqG/XwCvVnips4z4OvCLyMfEmb
 erKOKV4gnox8Z1lQFjl66WSwXU/jyvJLpgmzF2hvXn3UE0lXre9XO3Uy35IpuPsi8cCbGCq9L4A
 V5uQ0oQcYZUB9hnlBdfWpmc5ScDs5DC60VOCfho0GthiQ4BqxLbQxp+e9G4Zan1A2aWtZuj+CVT
 jWQ11chTAvvN1eCdAyaoX7C9urjWpbG/Aywa+YXqKfAoTPz+3fT0RHfHWH7S0izNRw7MnO8Q6WI
 CmnY0XVx0LN6Y09nAo4uRGRIJWbGon/qZs3T4WslAKOm3EVGJYCKiIMm7ggnFMauVWegBGC+pH+
 /fvMULPn
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3f674 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tOlg4r5JIpINhLxCU78A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Kg4MJyAHf9G2QmJMZ9GbEYyEv31mUj8J
X-Proofpoint-ORIG-GUID: Kg4MJyAHf9G2QmJMZ9GbEYyEv31mUj8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 10:55:07PM +0800, Xiangxu Yin wrote:
> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 192 ++++++++++++++++++++++++++++++-
>  1 file changed, 191 insertions(+), 1 deletion(-)
> 
> @@ -1669,6 +1832,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>  	return 0;
>  }
>  
> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
> +{
> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
> +
> +	if (args->args_count == 0)
> +		return qmp->usb_phy;
> +
> +	switch (args->args[0]) {
> +	case QMP_USB43DP_USB3_PHY:
> +		return qmp->usb_phy;
> +	case QMP_USB43DP_DP_PHY:
> +		return qmp->dp_phy;

return qmp->dp_phy ?: ERR_PTR(-ENODEV);

We are not expected to return NULL here (and dp_phy can be NULL).

> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
>  static int qmp_usbc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1743,9 +1923,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(qmp->usb_phy, qmp);
>  
> +	if (qmp->dp_serdes != 0) {
> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
> +		if (IS_ERR(qmp->dp_phy)) {
> +			ret = PTR_ERR(qmp->dp_phy);
> +			dev_err(dev, "failed to create PHY: %d\n", ret);
> +			goto err_node_put;
> +		}
> +		phy_set_drvdata(qmp->dp_phy, qmp);
> +	}
> +
>  	of_node_put(np);
>  
> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
