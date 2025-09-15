Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F1B575BC
	for <lists+freedreno@lfdr.de>; Mon, 15 Sep 2025 12:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5F210E3CB;
	Mon, 15 Sep 2025 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBc6wlxT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798FA10E3CB
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:12:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FdAN020478
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sKD/3kPWUFAIEKI0UmpKQAcxh9lP5Wru5KsNYI2Yxfo=; b=ZBc6wlxTY2NrEsig
 4fQSCUgYY0661833ZRKf3dhutGaTAzFuHKLF3C1rfXISL2/jQUDk9D013zPWen2u
 wZIPk1j2YBJ/R2kQl07dACQ8jGwRzyItehxgwlk9Edh24ZmWGBY6yc0NnX3mcafn
 0HNtDPxk0fs1714LQ6pRoeqkF0tzHWRE4bSyy6Qwq2eP4gNuu37lfyKUwfMoHrVE
 QTYIw+5pNEaUPbC9mwZ436p61Q2YDL6KYHHsKtmRQiCjQnjU/soVB0yVci1F8tab
 OV68RFIxLx7hl3P/HKZr13Nn2vxowr3nXiMCJpb/wjfLKTnd2EgynxizCnhZNmG4
 B0N/Yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv4hf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:12:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4e922de71aso936141a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 03:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757931139; x=1758535939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sKD/3kPWUFAIEKI0UmpKQAcxh9lP5Wru5KsNYI2Yxfo=;
 b=o9grcJN6g9syCXj55dRxvCQ2WXGyNv5b1G4CHTpyCn2lm81a+zUqL3sejJpYELTZ2V
 eeumZdB0hIcqUf5QVHv8d80EOP8U2j2MSSStWKCWTtWFD9mVK6ajqGc20UpledI63lCP
 yb41DzF5VaxiKqwZKdUPHfaUmcWbRLunkTvL8+nNmnxh8icbPMi8nWQ1HVgkDwv9FAkr
 qhsvcYUM76L44JwJfwKX9BZv+h/xSTHTeA1NoELcVO0LTZf0Id3RrGiHl6AiORYljSZz
 Lbi2NyPVba1zQMymaur7YxRDOf5uVQZXt7BBNvFOog7ou7nX4mpNVhLNhiVrkSA52pnD
 O7tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs/DDejjvP7A/2gvjmBI4TdOTwGCy/oRpSqvIYbaLyOmgYdVz2GB7VSga5X7F1Ma14ivEozKE34+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcFE2WxIV07/B5th4k9m+Q4zAmnR3VLSjWIonvVIm8w8jXb/nw
 UXL/z7jD7WiIItWUdcN1gzv2fnzzPsJFbuhGJYcNemPeAeEigkcW9+SAk1pTcFlsGcQ7/ZkYlkS
 4XxODWOmN/IG5KMXbRBM/y+PvYaKdEa+RMArU6Er8kYKTL8GeJFtZtZS5sylb7sDy2k/8PKM=
X-Gm-Gg: ASbGncvn5H0/5k6XDgmccwrmRcYP6CnnHcti6Z9B5W7m6OAKIPxSf2gguU0EAg0Bv83
 /oFTcfKi0M+o0jvqEZxVxGNr3bvAhbTScfff211JmmhV+cHa4JHzossxkFHQcgacfQT3FZd7Bhk
 GhZRh5y4XH8ii6pOIeTDexXFA6BF98FSxJK3mBdQeCQOoZpqiEkF5d7rSgitOQRxw/mqdVLGjE0
 s1vSQ5Wpz4DkbSG0s25gPYdvGH8IPcoHxWcBC44hWuwKxKtjxQF4yQKcFfgiEaVtZhwwmYpjYyS
 S8yeqDVq1JqUUUJHL91h7cn8HqV/TiX2jmn4y3Kk39Ffqwimn1lTINEqlhTR7+yO62Gg/kpGUZs
 /v8RPZ+YEjRM7CMpaYlTJ0SG/9TSuZg10r/Q=
X-Received: by 2002:a05:6a21:328d:b0:264:10e4:f87 with SMTP id
 adf61e73a8af0-26410e411fbmr1664435637.4.1757931139306; 
 Mon, 15 Sep 2025 03:12:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxZXxZBGVcbThhG/IvVDI3mpTgc5wznmZnjs66RxbpQzCycjFMO9w4+/RnbJr+43MLjBFNnw==
X-Received: by 2002:a05:6a21:328d:b0:264:10e4:f87 with SMTP id
 adf61e73a8af0-26410e411fbmr1664402637.4.1757931138808; 
 Mon, 15 Sep 2025 03:12:18 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54b03cf65csm8329380a12.16.2025.09.15.03.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 03:12:18 -0700 (PDT)
Message-ID: <f030649a-9505-4bda-9ce9-00eeee8d3b06@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:12:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
 <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
 <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
 <q4dplt6fq3cneludcuhxevklaj6omeio3cjxw2owt4h3wistd6@arv23ri4cl75>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <q4dplt6fq3cneludcuhxevklaj6omeio3cjxw2owt4h3wistd6@arv23ri4cl75>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: svzVsKPZvx9r06rv4aTbrQa7dm50CfZU
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7e684 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CZmHqXGeirO8O24YQhMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: svzVsKPZvx9r06rv4aTbrQa7dm50CfZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX5T3kuQhIthb6
 ZW0mrhB4y/W6PrQGzBYU/B1zXfAQoHCyroqKtD+wnkMxO0j2otDUq8N9a6fMUfNlstSLz3ZmO6O
 4HiJMtCR8pZXkhYawN+9u8BjiPyJpR7UGVUBmtG4VXjPZVCn2dHMvCPC/SQFLl2iQUVROS9FXQC
 1A0rdLuxi+ssshBO2HhyylhLyLgAXgNUw2pcKBLRnZ5fvhCgUt3A4PgF/45TX34rtle3Py7QLvL
 LNsZWMs/p0MTHzGVPtNcb20A4nciknoc9rU10HvQ7xklYwTvWISnn8Xa4TGwlwSSm18ohxMEdfk
 +Aui+6S1r9KqOW+0mqumKQ1wLvlOx/4N2JCiN55kiTZPdhFMGB2jFObrK16cnPcAOMuPcUYLun2
 dPnUE3sO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029
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


On 9/12/2025 8:09 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 08:03:01PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 6:32 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
>>>> Introduce mutual exclusion between USB and DP PHY modes to prevent
>>>> simultaneous activation.
>>> Describe the problem that you are trying to solve first.
>>
>> Ok.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>>>>  1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
>>> mutex has a very well defined use case - a sleeping lock. Please find
>>> some ofther name.
>>
>> Then how about 'qmp_check_exclude_phy'?
>
> qmp_usbc_check_phy_status()?


Ok.


>>
>>>> +{
>>>> +	if ((is_dp && qmp->usb_init_count) ||
>>>> +	    (!is_dp && qmp->dp_init_count)) {
>>>> +		dev_err(qmp->dev,
>>>> +			"PHY is configured for %s, can not enable %s\n",
>>>> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
>>>> +		return -EBUSY;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int qmp_usbc_usb_enable(struct phy *phy)
>>>>  {
>>>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
