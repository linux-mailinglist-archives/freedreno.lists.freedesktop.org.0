Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E85B575E4
	for <lists+freedreno@lfdr.de>; Mon, 15 Sep 2025 12:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAAF10E3E2;
	Mon, 15 Sep 2025 10:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="peFhYz53";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB01D10E3E4
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:14:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8G6Zh009023
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3/tnKANI76V9eS3ptRNqiDQ2
 LTSSD/MVKHWal1FM7D0=; b=peFhYz53eralrtCuMSLmXk7u10S4Kdpd2NTyQJYw
 pLjpp1++cemZlt1FfDXZcFMqkqXTY2UYg/3h9owZmT5Z86R9PqmW1wZSfIQf5KM1
 FbHgXlt4MJDuf54BXLtTl4Bk4gIIwEQ7viEELUtGTa3kWTlKf3e2LX2u+JQTIThf
 xFP1a2KWjeoRA/8hzZMMW5S3nB9M9Ze/vmlxqaR2HgmCMo1rZHyrkSt+TodH3+qI
 kv4d8I+zmCwsE7oSLrXoflh4iSGMs63nFd7ESFGhh44LH9S3JnY0doO0Dh1aSWPI
 cqF16KjTEr4bgsOceldhEAkBWJkE+4rCEIB4tzlDY4bPNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpucf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:14:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b47b4d296eso107256121cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 03:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757931256; x=1758536056;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/tnKANI76V9eS3ptRNqiDQ2LTSSD/MVKHWal1FM7D0=;
 b=xDgklHjogoLjpey7iLZSyKlmj8CcBHXbIdLXmS+hIrppQqNCOLNImxVOe264mAyN+Q
 fc0JVB3por70q1ouJq8IDX1t189AiqFWv1cGYUHcVFhkELcsv6s0rLuJlV58sf9itO/Y
 Q6GhUzAXF4rfeoaQOdrAZzP5OsK73hglWS3D+dwmfGBl++vDXlQb++hG5VsqNBbuMkDE
 j8Bz27ooX5gSsPMqSynvJl3qx7FU99UtrXu8dGOBfq3kViQwfOvKMDjznezc+vWuedU7
 lEmO4eeP96l+67L2MAyyvekDbCedzduVhbBfcwrr3jd8yCsd3EYGVTH8uuwCa/NBpr6g
 GqNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUju3OsR5AdLHItDJ3KHx1MVThhF8PwVMfmAJGkaAxspzagTrgE2jomYwRxJJWXtxgduZ+Zqg1GP5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2MrhHZGnNIYraCSGQck5oNuafjZgNef20lLCOfjasDk3Cshrb
 nYICpA9tK9jzOGgNfhUt15WeZOkEtCBcfDUNy08ahzYlm75yCYljpSLODUsRVuze3vZ0Dune0CY
 xPpCBONFG5VzQbGqGSDs34qSbLPsnOCPOuM3jXsPWd9SlaIHSJnztXzGyn87+gbOmUn1I6oI=
X-Gm-Gg: ASbGncvTYFUnRgX3G9MW6KQKAchchWr/bDH+TjggthIx19FGFmt15SHzNHHKyNgQlyC
 4tl3xmnOzVxGU5wwcyOPzgl2kAtnHQ7hp5Hu3H3ggN898tyDHBKUtDJdvQIw1kOlioO2SIXkF4z
 f3rOM0AluMuGON5UI5caC2fe+eb0OFwcDuNHGdvyeq63+Z9wGz83ZsnrsMT1V9DsGGn3dQVigkO
 Y6/jbNmZfYgiIpz3ryS2IMhMQMz7e538re1/XRdi/P/+qrz+8e1YEn/I3Q8RPIQhg4C+ZCxebof
 G897OBayZpqrWPc7nuch6x9A1R+nto8/j3WYfzFiU+jGJTTEHzWVxDlG68VRfPmbqEjskg+zlwZ
 AKawGxgbrozdr9ZEA4e5IqIFNAIKj6manBYgGrb6M9Q7oZAzLQ0OO
X-Received: by 2002:ac8:5f4f:0:b0:4b5:d5ed:e972 with SMTP id
 d75a77b69052e-4b77cfc1cbbmr143392351cf.2.1757931255861; 
 Mon, 15 Sep 2025 03:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAfuNCGve0i3eB424H9NLK+h/vY9qauhRsX9Z973SrspafnTcgWaopsqQyYHApzqc7SEdykQ==
X-Received: by 2002:ac8:5f4f:0:b0:4b5:d5ed:e972 with SMTP id
 d75a77b69052e-4b77cfc1cbbmr143392021cf.2.1757931255326; 
 Mon, 15 Sep 2025 03:14:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e64bd15e6sm3415142e87.116.2025.09.15.03.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 03:14:14 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:14:12 +0300
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
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
 <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
 <335ffce5-19c6-409d-8386-686fe9e5dea5@oss.qualcomm.com>
 <7ozv3u7xuvtz2x5q3pp5kdeydtsu5jlrgwjnxpxxiuh7przr2z@35uo7t3b4ze2>
 <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
X-Proofpoint-GUID: 0av79C7wRNkjEOInWwOXwUjZxhS-iF7P
X-Proofpoint-ORIG-GUID: 0av79C7wRNkjEOInWwOXwUjZxhS-iF7P
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c7e6f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Pk3c0UAvwP2i0KrjZkwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfXyByPRcmI9rCv
 t5NXF1wpa7vqT7bgKmMz6tkB+yV6KBK+tUVC0DOolEXTfNRGD4EH3LMc4XgkfhRX6iDwpeZX756
 ZIgi7Rj8Laobr33SHmT2nAzPq6C2U2nwUamuAAGl2i2rQpSCi4K1NCLZidV2PC4umDCkS7LdxhC
 uXB+qYPyEIq+90OPYRkL0Oh05sAEiSLyTgG0t8OC4nwVKOHmmws0G/90dvTbQ8mtwDpw/2Yeshd
 r0uI/RHEqjcGcwPIzXJ/Gs2ClihfiO8tXk8RRsJPhOG/i8IysFqVFNwUOUNCGPOC+pXnZGFL7QH
 +UQxhOj1Yv8E3nnbrdcWLalntLGwk31XsiOsxs4bj5rKfyllG9d5SK2bg+AXuEjfx98yK3mb1WF
 Yep7xlH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186
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

On Mon, Sep 15, 2025 at 06:02:19PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 8:08 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 08:00:14PM +0800, Xiangxu Yin wrote:
> >> On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
> >>>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> >>>> Extend qmp_usbc_register_clocks and clock provider logic to support both
> >>>> USB and DP instances.
> >>>>
> >>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
> >>>>  1 file changed, 195 insertions(+), 13 deletions(-)

> >>>> +	default:
> >>>> +		return 0;
> >>>> +	}
> >>>> +}
> >>>> +
> >>>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
> >>>> +{
> >>>> +	int ret;
> >>>>  
> >>>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
> >>>> +	ret = phy_pipe_clk_register(qmp, np);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>  
> >>>> -	/*
> >>>> -	 * Roll a devm action because the clock provider is the child node, but
> >>>> -	 * the child node is not actually a device.
> >>>> -	 */
> >>>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> >>>> +	if (qmp->dp_serdes != 0) {
> >>>> +		ret = phy_dp_clks_register(qmp, np);
> >>>> +		if (ret)
> >>>> +			return ret;
> >>>> +	}
> >>>> +
> >>>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
> >>> Do you understand what did the comment (that you've removed) say? And
> >>> why?
> >
> > And this was ignored :-(
> 
> Sorry for missing this part.
> 
> For USB-C PHY, the legacy implementation only supports USB with a single
> device node. The new driver for USB and DP also uses a single device node.

There is no 'new driver'. It's about DT.

> The function devm_of_clk_add_hw_provider internally handles both
> of_clk_add_hw_provider and devres_add, and supports automatic resource
> release.
> 
> So I think using devm_of_clk_add_hw_provider allows us to remove
> of_clk_add_hw_provider and devm_add_action_or_reset.

Which node is passed to of_clk_add_hw_provider() in the legacy DT case?
Which node is passed to of_clk_add_hw_provider() by
devm_of_clk_add_hw_provider()?

> For combo PHY, the legacy implementation uses two device nodes: dp_np and
> usb_np. To maintain forward compatibility, we need to keep support for
> both nodes and retain the related logic.

-- 
With best wishes
Dmitry
