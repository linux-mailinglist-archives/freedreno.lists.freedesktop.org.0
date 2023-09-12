Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE379DC56
	for <lists+freedreno@lfdr.de>; Wed, 13 Sep 2023 01:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0055C10E00E;
	Tue, 12 Sep 2023 23:01:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622F610E00E
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 23:01:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38CMF8I5020182
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 23:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Zc0vZJyJWfFNyosgi8H2tJOHP1IfA4elI2XGiPuhFF8=;
 b=Pj8pi283MekIiqwpb5RnjSK5Jm07Z/59xJ48C7pc5u4Q9SEvjry4THaCtRJL0cIxe1yY
 HjB7or+sqEZpEmvr1X1pwjoSbZ9QNerhhY7AvB+WulaxUBfa30Lz5yVXR9Z7KjZHCqAh
 HrcihURvy1xEuCUa3iY4jv5V098caPwMp2vTg3dobmkM6zSkcmQfzNGCWvVqwDZvknfX
 YKlvbcyf9A5DFio1K8GUG4dPBLyonBrCNAr9hvNSP6OONhz4x9cn+asJI9SsNL6ChF3a
 ZTa7A3CzmULcPlGFTbPb0Ia7sSXZwINuFWc44J32XHXQ8CwU5R8lcVNecBNL2I+K8vin mA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y8e06u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 23:01:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CN0me9030573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 23:00:48 GMT
Received: from [10.110.110.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 16:00:47 -0700
Message-ID: <f535858e-0d91-4dae-f10d-a16c1f1f4c7a@quicinc.com>
Date: Tue, 12 Sep 2023 16:00:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <20230901142034.580802-1-jani.nikula@intel.com>
 <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dWbIzmpRLIr0mWqew_27SrGbtF3-vhyc
X-Proofpoint-GUID: dWbIzmpRLIr0mWqew_27SrGbtF3-vhyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_22,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120196
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: skip validity check for DP CTS
 EDID checksum
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


On 9/7/2023 2:46 PM, Stephen Boyd wrote:
> Quoting Jani Nikula (2023-09-01 07:20:34)
>> The DP CTS test for EDID last block checksum expects the checksum for
>> the last block, invalid or not. Skip the validity check.
>>
>> For the most part (*), the EDIDs returned by drm_get_edid() will be
>> valid anyway, and there's the CTS workaround to get the checksum for
>> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
>> correct edid checksum after corrupted edid checksum read").
>>
>> This lets us remove one user of drm_edid_block_valid() with hopes the
>> function can be removed altogether in the future.
>>
>> (*) drm_get_edid() ignores checksum errors on CTA extensions.
>>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Stephen Boyd <swboyd@chromium.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 42d52510ffd4..86a8e06c7a60 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>>
>>   static u8 dp_panel_get_edid_checksum(struct edid *edid)
> It would be nice to make 'edid' const here in another patch.
