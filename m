Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0126EB30F82
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 08:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBB410E06D;
	Fri, 22 Aug 2025 06:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpypsNBc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D1E10E06D
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:49:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M66t4r029884
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PAelQyATkPA6YSXiRQaF3kDsfrHXJ4J/shH4gx5CIb8=; b=XpypsNBcuyAp/E9l
 cMSqL9doPX/KQeFqCC5fdM4wqiI1J54UThwJttpQCwPqaSWuP3Exn3DdAtl6z7nH
 dxunfAwgv4QMLgEo2clVv8ZtS7Hl5FjHMy2ujAsTDUJYY0jt6qtfMKI1xgZMo7fr
 K3O//G/YQBO0uqeuP83fdJl+g5dwuMzWisOt+OYY8y37rekTc1VPy0j5gp0cuBBE
 G1Hse0gaaU4//wDwBnX7+uL17KX0/EKFzABR9OY79PS+8tKi+f++eLP3WmpwMSEv
 1Gcl+sbQ4IP9+x+gdEHHa8m3Fc31y/QIxHm42aNykv4nJRwADxGei5WViPKfh+J2
 5Aso1g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a860u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:49:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b49c7295627so12216a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 23:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755845363; x=1756450163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PAelQyATkPA6YSXiRQaF3kDsfrHXJ4J/shH4gx5CIb8=;
 b=U2Y0pieTxO3/bB1ihNY9XaFHOnQ5oA+GTwIUfO79y6GxmCgnTHfBc1MhSHKtn2bbbQ
 oFIIUd3zxOrPhP7EinWqLLK/MaymcEms+IsqRRWXXwWTF2h7x1BmXeheTfQlghygK5h1
 gQc1pRVjRR4jPNZGyRHQtCMP79wXZxQdZLae7BM7RAi7GlHTtzhPE1u0lbItzNGdce64
 UQKeMA/YE7vMgDz+Q+8EKA07vHhZYE/fT4FOoSqqJFbK558fBcjJ4MDoo6wi1UN8O8My
 QhajBl3ssgqm0kz7qxbaY0pVUDQOqWweW/SPy+yR41SqZefEEIFQ7X27mMWJQOAoNeqT
 dDkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnmIltLiuBGwc6oWox+rTcSnlndq4fMH+UxMyAKLU0SOM/77fIMzy6hl1xdYbWzGNIMy4aY3hhNYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz42wCUu0+vIEgLdkPihCaP293c/0XoK2+nqF8b2CAdFNMP7R2F
 9y2454QDAhV81Mh/DLefKp1sJSjm0//sLw8arOGPbQ5OhGkqV0rTAJojo1itMSbqtcZqsSDg4Ty
 cL5VVkW9kDKSFqLZj2KGFDzC8o8+/ZoGvqBInAajG1BQcAO99VCkOiu46uaSmdcaitHmL3xXOhk
 fEJ4c=
X-Gm-Gg: ASbGncv3BT6M6lKPzRJzL0akclcsM2TCAPFUswIuIc79f9xiHicn8oqTll3NsmRK0tM
 QqvsfT469vxWmArRVXtHa8fwdK3fggoqKrhgNiSxyAwMjl4HfHcyq+BCgZuLQcEu8Z0ORxzC4Zx
 KL3CSR5QH0GRuMmTCeolvDgKtWw3UgwE9i1XkV9Z69VbIXAEAQkCBm50mwFnqFFZLaNS4iUs+FF
 bufpZZAtSQ03urkRa8Yr7k+/5T2uavRLeWHmfv/KFN8uVMJfSlti5TNTbBNjJ4rHvvHu1NPyhsr
 iCRKFjHu4iu6IyjW/rpCcH80FrImq7mmgPVD+jxQtiW7Wr0NLys/hcJSrWfVKGX3rv0fy6YWKJ+
 wlNC3rUlzjXftC1di0/v+uzMxipZfCw==
X-Received: by 2002:a05:6a00:4b16:b0:748:f854:b76b with SMTP id
 d2e1a72fcca58-7702fc0b4b9mr1451088b3a.3.1755845362720; 
 Thu, 21 Aug 2025 23:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw2XinJYhFdfeOr2DKaBI1LxvJNvXAx1nbOyA+a6mHNvNi1D2KrOEAJ42/+JTdElCmxHO/Qw==
X-Received: by 2002:a05:6a00:4b16:b0:748:f854:b76b with SMTP id
 d2e1a72fcca58-7702fc0b4b9mr1451069b3a.3.1755845362261; 
 Thu, 21 Aug 2025 23:49:22 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdd6sm10099827b3a.29.2025.08.21.23.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:49:21 -0700 (PDT)
Message-ID: <d21c4c74-a36b-4f01-9c22-44bcec3c20eb@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:49:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
 <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a812f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LJgbN-Jd--P93uwsTkIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ZmnG1jN1TDzCdklvkMvOiFJ2UlMwfqBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyRxtTnIcFxTW
 iVUp2jx43V1UxSDuRSTqcvhW2viyph/YxPukA88w2uDSOlj2bjpaJU1S+rtEs1p2iEEdrqKSxI0
 acl7kqhVD61U4/o+Xw2DrSnGJFp8A5jyPwaFnb3irEK/b7CDSG3vUcDGcemua+TZ7/ICRbkbpsw
 gB6nPUT1lAfWrUoqAvgMQfPbgoypGXHqDHUtf8hcEqVH7VhHnm4bBSxPvSiuL/EcwCPqGPCm3yj
 rbOws7k6Re0EoprvD/rtJ6RQuRaC7NqrnjpZcFMUPTzmnXsJxzdCrtEw3X3YceZCdNfaF81st/5
 /DBCbaJvDsg/NgstD7Iv8HWaP15LdlaS6SYcyxO4ANrqUEVBCRnTbt1q9uCOT8XUGsyo3XNBCLj
 EtgR4al50jRAg5GgSFBPACCipUYbMg==
X-Proofpoint-GUID: ZmnG1jN1TDzCdklvkMvOiFJ2UlMwfqBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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


On 8/20/2025 7:34 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:46PM +0800, Xiangxu Yin wrote:
>> Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
>> differentiate between USB-only PHYs and USB/DP switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>>  };
>>  
>> +enum qmp_phy_usbc_type {
>> +	QMP_PHY_USBC_USB3_ONLY,
>> +	QMP_PHY_USBC_USB3_DP,
> Drop, you can use presense of DP offsets in order to differentiate
> between USB3 and USB3+DP.


Ok, will drop.


>> +};
>> +
>>  struct qmp_usbc_offsets {
>>  	u16 serdes;
>>  	u16 pcs;
