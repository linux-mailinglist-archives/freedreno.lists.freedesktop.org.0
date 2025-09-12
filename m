Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C2B54C1C
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7C710E1B7;
	Fri, 12 Sep 2025 12:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LThO0WJb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A2610E1B7
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:01:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fE5f001295
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tR4WV22vf2t/EPkoMZ6ryeD+FVZWeK5RDIR27BMiiCM=; b=LThO0WJbd+uPPfql
 1T9rEvTNfMVif9MJ3ij5xNWCkqiPRYhUWsu++34zYOfSEnJdUDTfwdZBGx5u8VfH
 xmpwjPI4+cVMRRDpIOXYXMLZa05jPm1I1MCntLGcOMP8FcTn5SY554s4VLfwP0Np
 2rtES9jCBlUL1CAihVaHgQ+7dLHSMx3u92rkbEcbqTmzyt0mn74Uv8y4yPw9GDn5
 vLa9znZ/rkzy+eokbXzq0LrydSNBvamx3xMhXAm5cX7MZqX0LaHMnc2GCXujp43K
 1HmLkdiWKvBp8YRYurXbcUTShfrnenWbAVcBVy/FYfaGG4JAhy4qnoyKeqrLEJJz
 UHa/1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h6j4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:01:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24b172f65edso2729755ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678499; x=1758283299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tR4WV22vf2t/EPkoMZ6ryeD+FVZWeK5RDIR27BMiiCM=;
 b=VHafD/y2ltO0OKYKk06eL88bLvPI+cYhoIXNtfbyGZNUiD7Exz6IZPRHlgyrSFu606
 x7gVXmq3DiVjkIZKxGZqYgXODO2nVX3jrPld83Xsth7Vb1XIHBnUuGeTyt0GmCB+pxjY
 IX93iGRKJyfGOvycH5EiJpmMIZ5ZBNJGEf8t+9AbzB4unlHR++pUgLmQl7A5OIcO3kwo
 R8GXVuUlUs/aEs66M+3XivKey1WbP6QxKRQ6ZVT1QatI6qYaNoa5DdH14PV9EFZmamu8
 ZuFFFjS6RKg2RrcuzcOGFntX/ZZhveCpd5ZIU+o33wj58PwyJ2YVQnuG+58rrt7sha4W
 Z4yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUldXBsODkleU740mF6xxmz6vObye2YZ1ix+suT6CnxsLoP/fW/Ihe0Je/PlyvKwXg284fcLU+VIRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSyeWOe7v8gpyKbVWMMFrKm8L6l+byxnmVfItIZJANN/6V0ER2
 cgqUFS31hOlSeS4kX45vJogf2OeGE+DgvNYU3gykt2s5HH7xFs3CaJLKGBKGnsn7GOTUGffY/KX
 5WnVWku7jr8O3bmLP66ThlzKMbmxmJaqHlPxbZKdqCbgZNHmqFgP0btzSPOzupGS2EC4ZDAY=
X-Gm-Gg: ASbGnctVVHj6BWn3PrXdFRY3IFn58v1fIMwOZNRxISFVBX3Wmo0ENIsaAAU86ZbXkcj
 BArTs215xI8OxYe45v8rL0ikPPleOooDBQ0p7rH1ms//s5kfoaPrE86Mmpz7De0hROHIVji5FUY
 cmcF7N3edQ8B5ELEAIZAHXT3FW2l63xUsYPs2sapfQWW3CQeqMt8tr2/lURNhcpxRuRc+n0V2VV
 6i2YWmwVuvnOtVFRObN16+L5OdUGYCU8+fDo1YGQ3KJLttQIDVr2BeQcGbVfSKHOThoEBhdunfK
 BEJE//aGNKVvoEgpIzpw0QAcvhxfmh5JXwBU6EuaxCFiKxHaZKIvo0K1vNwTxE99+FPLEFhLTiN
 Xtbf7rL69knNfIsj7vvE1UYbeT6qEiA==
X-Received: by 2002:a17:903:1ce:b0:25e:8089:5070 with SMTP id
 d9443c01a7336-25e80895390mr5790505ad.1.1757678498806; 
 Fri, 12 Sep 2025 05:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRWUteHVEdJSYAR1rniB1eDfwR2hwSrNL/NbjOkI3aWK1MO0R3uv5T0gv0XZ2mKId4uJql1Q==
X-Received: by 2002:a17:903:1ce:b0:25e:8089:5070 with SMTP id
 d9443c01a7336-25e80895390mr5789845ad.1.1757678498117; 
 Fri, 12 Sep 2025 05:01:38 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c36cc6cc5sm47586865ad.27.2025.09.12.05.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:01:37 -0700 (PDT)
Message-ID: <9fa9f9e4-b7fa-42fd-b367-9d52e0f1f184@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:01:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
 <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9T3xRApB7frpA7OxSmocKiv2BuadiGoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX+fBfKIbLSJ8x
 00oghjRNeefywmrChNiTC3CUuIg9m06SIaagHBpZiVLWAlMScBjxDZLeHLCkrnqZCAdC6tNPdYv
 //zihyS2mMaRicMltK2A9uWSHZkip4xihhJmtW8uzXVG+iitGB2qZLjniEuawoigOTrpBYyKvrh
 ZG/cKNc68MYvVp/K47LA/vpHd5adlZ3bcRhZnJULL1cE5+o//qomR80A3kZCW9ZDO5SXBnzMIZO
 u69B+oX5RJ01FvUj2T94tX/qlt/4IrJKwsjr48JkAx0/7njyEdrk8crkwuFyItHulhi1/pf/Gh/
 cPpP6EWdemJ21bLAT7R2BuhviRkplU4jTP8t6hL6GyO9NKD4tJSOBz8Qdrc3bLz5O5T4nBPbuQS
 I+3x9tH4
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c40ba3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ctQwHQabY_GzZcauxAMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9T3xRApB7frpA7OxSmocKiv2BuadiGoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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


On 9/12/2025 6:31 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:07PM +0800, Xiangxu Yin wrote:
>> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
>> switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 192 ++++++++++++++++++++++++++++++-
>>  1 file changed, 191 insertions(+), 1 deletion(-)
>>
>> @@ -1669,6 +1832,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>>  	return 0;
>>  }
>>  
>> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
>> +{
>> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
>> +
>> +	if (args->args_count == 0)
>> +		return qmp->usb_phy;
>> +
>> +	switch (args->args[0]) {
>> +	case QMP_USB43DP_USB3_PHY:
>> +		return qmp->usb_phy;
>> +	case QMP_USB43DP_DP_PHY:
>> +		return qmp->dp_phy;
> return qmp->dp_phy ?: ERR_PTR(-ENODEV);
>
> We are not expected to return NULL here (and dp_phy can be NULL).


Ack. will update.


>> +	}
>> +
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>>  static int qmp_usbc_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -1743,9 +1923,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  
>>  	phy_set_drvdata(qmp->usb_phy, qmp);
>>  
>> +	if (qmp->dp_serdes != 0) {
>> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
>> +		if (IS_ERR(qmp->dp_phy)) {
>> +			ret = PTR_ERR(qmp->dp_phy);
>> +			dev_err(dev, "failed to create PHY: %d\n", ret);
>> +			goto err_node_put;
>> +		}
>> +		phy_set_drvdata(qmp->dp_phy, qmp);
>> +	}
>> +
>>  	of_node_put(np);
>>  
>> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>>  
>>  	return PTR_ERR_OR_ZERO(phy_provider);
>>  
>>
>> -- 
>> 2.34.1
>>
