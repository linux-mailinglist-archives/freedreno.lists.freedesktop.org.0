Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78C163E4B4
	for <lists+freedreno@lfdr.de>; Thu,  1 Dec 2022 00:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6699A10E0FE;
	Wed, 30 Nov 2022 23:11:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C320910E0FE
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 23:11:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AUJLnAr011085; Wed, 30 Nov 2022 23:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6L8WxzYS25Z3xMdnSUhEAIVuj/HTs6P68FVYkdT74RM=;
 b=fwNJYsG05rjDLxAasb56GpV79QqV4tebFcUm/+RLF3JiZFDGMk7ZqKeNcZU9g2pKAKoO
 BW4bgiIYjO4qZk4KYXJzwryP3lh0Jij60vpO6asitlk+aaLsizXkBRT0vFXf09OTElwJ
 lIEdqSGRnqS2V0B2/xpVVPWARgY9CyRAhMPAG92AGRjVMTv0Nb98uJVWS6mnh3xmy47S
 4P6w5P8TS6UH2DIlVvzIn++KonB9rWzByUxP4/PErXUFk6wJZK8c+m3U0drHyysxe4hg
 q8Ub1Sh7ln2oxWv6trE1BrK8a6SIyz/F6NekngUFShmleEetOIYUKgfFTsP6b0HhWZpn GQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5mhc5rsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 23:11:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AUNBaK5006283
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 23:11:36 GMT
Received: from [10.110.18.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 15:11:36 -0800
Message-ID: <930efdc2-8770-9548-36e9-34c7015ba312@quicinc.com>
Date: Wed, 30 Nov 2022 15:11:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, freedreno
 <freedreno@lists.freedesktop.org>
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpr_AODJ6WPB8_4aRY8q6XBy3-cXMOkox7VfL-PK1p4pQg@mail.gmail.com>
 <cce7ce65-b27f-93ee-9907-35072490f114@quicinc.com>
 <CAA8EJpq2H+fx+jMJ=E=7nno2vSMP5XdiM0eQrTZvk0ToETTg5Q@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpq2H+fx+jMJ=E=7nno2vSMP5XdiM0eQrTZvk0ToETTg5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6QQJUnfBzNaKb5kt5J0B9QD_YllPJPjW
X-Proofpoint-ORIG-GUID: 6QQJUnfBzNaKb5kt5J0B9QD_YllPJPjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300165
Subject: Re: [Freedreno] [PATCH v5 1/3] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
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


On 11/30/2022 10:24 AM, Dmitry Baryshkov wrote:
> On Wed, 30 Nov 2022 at 19:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 11/30/2022 1:20 AM, Dmitry Baryshkov wrote:
>>> On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>>> add link-frequencies property into dp_out endpoint as well. The last
>>>> frequency specified at link-frequencies will be the max link rate
>>>> supported by DP.
>>>>
>>>> Changes in v5:
>>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>> Bindings update?
>> Sorry, I did not get this.
>>
>> Can you please elaborate more specified what exactly you want me to do?
> You need to update device tree bindings. See
> Documentation/devicetree/bindings/display/msm/
got it, can I submit it as separate patch ?
>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>>>>    arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 +++++-
>>>>    2 files changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> index 754d2d6..39f0844 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
>>>>           status = "okay";
>>>>           pinctrl-names = "default";
>>>>           pinctrl-0 = <&dp_hot_plug_det>;
>>>> -       data-lanes = <0 1>;
>>>> +};
>>>> +
>>>> +&dp_out {
>>>> +    data-lanes = <0  1>;
>>>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
>>>>    };
>>>>
>>>>    &pm6150_adc {
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>> index 93e39fc..b7c343d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
>>>>           status = "okay";
>>>>           pinctrl-names = "default";
>>>>           pinctrl-0 = <&dp_hot_plug_det>;
>>>> -       data-lanes = <0 1>;
>>>> +};
>>>> +
>>>> +&dp_out {
>>>> +       data-lanes = <0  1>;
>>>> +       link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
>>>>    };
>>>>
>>>>    &mdss_mdp {
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>
>
