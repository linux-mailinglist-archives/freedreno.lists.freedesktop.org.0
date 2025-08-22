Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28303B31206
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 10:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB12610EA8C;
	Fri, 22 Aug 2025 08:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="axp2p5FV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B67E10EA8C
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 08:43:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UGZp005738
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 08:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 prp9ElU8fS7+zbL7ub2mUXEAEbk0qpOcYYPRR8CM44Q=; b=axp2p5FVzEy9YAcS
 QpKxjbGkrARU1RbimpueVhli6iCQEpUDyqcg494lAA22Jsblt0Th/sBfiscGIE69
 1cMrxA9iLjFC8wqeBW3j+iVi4qMr7244u1I2nLm0h8ZcHGhRtGUE91bywbj+wAC+
 dS1OXqb5MHjUQgLEWmycT0onvSSvjEhCGo3MvcxRyatfJNxu//k0NhgqtqE48r/o
 IQxgsdFIhbVJrbr+U3VeiDUKJ6oh2ETrWciK8ez1kn1/YDad6B5nZdZUNVYnfMn2
 t4hhYkryc5kLI8EpPH6r4NFTYV4FS6Ojkiu8Keq4erueicN48lcstEy2lB1MfY/4
 iGR/rA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290gur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 08:43:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24457f41f79so4155145ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755852201; x=1756457001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=prp9ElU8fS7+zbL7ub2mUXEAEbk0qpOcYYPRR8CM44Q=;
 b=ZWxPLHrwvJwfF5H8bxJ2d/TsV2zDcKtOrfS8IIAHKNo/J4mlluOCFSUtAKAYD8HNEQ
 blEKYgk0lqHf6Z2AElepfeYhgw1WfX1t16/jghqdy0Ez8z+Yc3WUJ5OFgwu7773ZnGsm
 3rqK1G3Ra4xrAo18bL8wXKWyy2Qb0/iZ9twiRLTlUtaSBqMEOArIohmHM3lD4LeaLAXN
 elY1wpZUHL2iNc+a/AN9gKN4cr0oniRZ7u5FIaq07UGWJWYnXC4LWhSzHFUIWuqhTF5R
 UlDhBs9FDpS4019HZYAn84iJWBl9R/yeqxApyQS8Viy2EO8MkTOsvqFhb/dcMP5VWbCN
 tDdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOLIYfDlHc3pm0pCTQLFHGNn3eEeh0qxfTgYe7O3OQY3aelQtRNbIqv3AI3RLYInN4CrwQAe5wjzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx1z/o8Soda+MEJnDYzAud3pVw7WtxaLB7GfFgBmvZdYDARaqP
 E3z36C6Fl82zRUzGEsipsSISPPSLwkXwW4GtmG/RqiAjLjiNZIJyCj1asf/CpFz+ZjAAoOsfA6x
 Sc48VpRGSglf5tsxxVMDCN2Ay1dOSSwnWvTp6uO/IkMACP+LVL9ngmSdfHrNaZVzAbVIkEUM=
X-Gm-Gg: ASbGnctPmmz2przpVpdiQSjx3zoP1T3AK+3zGOJsJWZ5ooD5iUB449+08I5WSUZrhDR
 dJP1hpXu4NZP/9VuUDLVFUxaJMMrJN1Ww5JQ9dYExysFhcnBueALptkygjfAXzxmLNn1/U0/fkQ
 qvgs6Pe7GtH5hPa6rJCsWhX/hkDidLj9yCTmoryiYxWhjCIi2F9VlHaoOgbm1DRWFjb0wv6lwvK
 ACyxh5aWtwx/4syNm2o5Ws1MRoV7rROKluF/oSHpGqC61b69FwOx1gt9M0DRBLRfHAuCv3WGofI
 f8k/CHQguajwEeWsp7DJ1118lqK6fUbhzguXAt9Ua7Bq4/qt9G3lUrXxb2DaUIr7WV456WBUyQh
 X64k5boO49rsSiuh2rfYtt4ldsQT84w==
X-Received: by 2002:a17:903:1d2:b0:240:3e41:57a3 with SMTP id
 d9443c01a7336-2462eb662c2mr18144925ad.0.1755852201141; 
 Fri, 22 Aug 2025 01:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEXolhUjPQKDUCRG284FJEb8zvrf0fcnVfDTTz3DHtqN0qA20e9P4wmEWvBmU3EEicTDFcdg==
X-Received: by 2002:a17:903:1d2:b0:240:3e41:57a3 with SMTP id
 d9443c01a7336-2462eb662c2mr18144665ad.0.1755852200709; 
 Fri, 22 Aug 2025 01:43:20 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c7588sm77576235ad.101.2025.08.22.01.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 01:43:20 -0700 (PDT)
Message-ID: <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 16:43:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
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
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
 <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a82daa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=B0UfJI3MrboyiCAuw3UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: zE-UIxZmJ5eDfpKqULQSxVe9BS7IR1DS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5/Mi969RBjnU
 Uq1jmW9i2Ni+7hz/A1/n+obMBt2jDsBy0Pwm2sci6rX4Xphyn9g6ds2RxIKOg5tfubmp+JSDIrM
 +OQwVPcv8SeuK+o58a7lZ5tmtPobDHfRBxxccH+pAh/7GmzcXOYC4XkSWxm/co+O5bqEaWG/Jg3
 jVtICzPIBRY/FImuaLHpqWeqTL52b5fdY2pO7JRpfzWAqMIvibeuZuZjKvOv/ewZ02D3Gfz/ed/
 idbJJEvYCIEnUWdFMneZM95b/+BRpQTUlCxppobcD2aKRx/S3Z5zNMIIy/DHZZGFGFZBwRl8phu
 hNrRB+HPQVqWnDYzn+2WhQo5o4juTcN38add3QEbAjQLmJ8QQ4tF9i63Xfinc+I4AONn4AHHaq7
 NOfzWdoXYn0hzGkpTKarcfHsLpYnBQ==
X-Proofpoint-ORIG-GUID: zE-UIxZmJ5eDfpKqULQSxVe9BS7IR1DS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
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


On 8/20/2025 7:16 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
>> Introduce DisplayPort PHY configuration routines for QCS615, including
>> aux channel setup, lane control, voltage swing tuning, clock
>> programming and calibration. These callbacks are registered via
>> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
>>  2 files changed, 252 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> @@ -25,6 +25,7 @@
>>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
>>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
>>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
>> +#define QSERDES_DP_PHY_VCO_DIV				0x068
> This register changes between PHY versions, so you can not declare it here.
>
> Otherwise LGTM.


Ok.

This PHY appears to be QMP_DP_PHY_V2, but there's no dedicated header for it yet. 

I’ll create |phy-qcom-qmp-dp-phy-v2.h| next patch and define |VCO_DIV| and shared offsets with V3 will be redefined accordingly.


>
>>  
>>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>>  # define QSERDES_V3_COM_BIAS_EN				0x0001
