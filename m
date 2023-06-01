Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8671F0E6
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 19:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4E10E59C;
	Thu,  1 Jun 2023 17:37:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DE810E59C
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 17:37:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351Fb8kk002220
 for <freedreno@lists.freedesktop.org>; Thu, 1 Jun 2023 17:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i70D5yricxGUCfxEhngNK8D4mWlpHhgDd02WaLTzuC0=;
 b=PwO3tvAyI6Ft8/TapJC2a31/o5OfCtrrS/NNApQxEouUVGgc3UPSSlog1PSpu77gMDoZ
 rAT+8ztupNy6qlRoV7IZyHgmaDezyMajzyWdfrROsDnoIEA5L9Dw/tiiZy9VJ/sJEYfw
 3L1iENuTjvd/SqKa6f7hAYAPpmv77Hok0XS5uLfZ6k8dkAzexAnAJRk2g3oHtJBXLb+F
 SU75TDmBe1W57P/q//6XkxloVqjAukzg2VJSTPjIn95VrA6BZ7OCMusF1VJdOJDHtaVB
 BpiRS/7HTsHqPx+vxHH0opYvYR3GltXcFb+HKULB9lwe9kAa7xiuV5WFK6mdeK7v4dnt DQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxqyd9f2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jun 2023 17:37:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351Hbt7e018662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 1 Jun 2023 17:37:55 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 10:37:54 -0700
Message-ID: <d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com>
Date: Thu, 1 Jun 2023 10:37:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
 <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
 <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HhHYWMT7ujKt_nE7GRLISpmpCU7zTG4e
X-Proofpoint-GUID: HhHYWMT7ujKt_nE7GRLISpmpCU7zTG4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2306010152
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct
 at atomic_check()
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


On 5/31/2023 10:53 AM, Dmitry Baryshkov wrote:
> On Wed, 31 May 2023 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 5/31/2023 10:12 AM, Dmitry Baryshkov wrote:
>>> On Wed, 31 May 2023 at 18:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>
>>>>>>     +    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>>>>> INTF_DSI
>>>>>
>>>>>> +        struct drm_bridge *bridge;
>>>>>> +
>>>>>> +        if (!dpu_enc->dsc) {
>>>>> This condition is not correct. We should be updating the DSC even if
>>>>> there is one.
>>>>>
>>>>>> +            bridge = drm_bridge_chain_get_first_bridge(drm_enc);
>>>>>> +            dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
>>>>> This approach will not work for the hot-pluggable outputs. The dpu_enc
>>>>> is not a part of the state. It should not be touched before
>>>>> atomic_commit actually commits changes.
>>>> where can drm_dsc_config be stored?
>>> I'd say, get it during atomic_check (and don't store it anywhere).
>>> Then get it during atomic_enable (and save in dpu_enc).
>> got it.
>>>>> Also, I don't think I like the API. It makes it impossible for the
>>>>> driver to check that the bridge is the actually our DSI bridge or not.
>>>>> Once you add DP here, the code will explode.
>>>>>
>>>>> I think instead we should extend the drm_bridge API to be able to get
>>>>> the DSC configuration from it directly. Additional care should be put
>>>>> to design an assymetrical API. Theoretically a drm_bridge can be both
>>>>> DSC source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge,
>>>>> supporting DSC on the DSI side too.
>>>> Form my understanding, a bridge contains two interfaces.
>>>>
>>>> Therefore I would think only one bridge for dsi-to-dp bridge? and this
>>>> bridge should represent the bridge chip?
>>>>
>>>> I am thinking adding an ops function, get_bridge_dsc() to struct
>>>> drm_bridge_funcs to retrieve drm_dsc_config.
>>> So, for this DSI-to-DP bridge will get_bridge_dsc() return DSC
>>> configuration for  the DSI or for the DP side of the bridge?
>> I would think should be DP side. there is no reason to enable dsc on
>> both DSI and DP fro a bridge chip.

My above statement is not correct. For DSI-to-DP bridge, 
drm_bridge_chain_get_first_bridge(drm_enc) return DSI bridge.

Is possible that DSC feature can be added to DSI-to-DP bridge?

If it is not possible, then we can rule out DSI-to-DP bridge case, then 
use struct drm_bridge to retrieve DSC form controller will work.



> Well, there can be. E.g. to lower the clock rates of the DSI link.
>
>> drm_bridge_chain_get_first_bridge(drm_enc) should return the bridge of
>> the controller.
>>
>> In DSI-to-DP bridge chip case, this controller will be the bridge chip
>> who configured to perform protocol conversion between DSI and DP.
>>
>> If DSC enabled should be at DP size which connect to panel.
> Ok, so it returns the DSC configuration of the bridge's source side.
> Now let's consider a panel bridge for the DSC-enabled DSI panel.
> Should get_bridge_dsc() return a DSC config in this case?
>
>>>> Do you have other suggestion?
>>> Let me think about it for a few days.

There is one option which is keep current

1) keep struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi 
*msm_dsi) at dsi.c

2) use  struct msm_display_info *disp_info saved at dpu_enc to locate 
struct msm_dsi from priv->dsi[] list (see item #3)

3)  info.dsc = msm_dsi_get_dsc_config(priv->dsi[info.h_tile_instance[0]]);

4) ballistically, keep original code but move  info.dsc = 
msm_dsi_get_dsc_config(priv->dsi[i]); to other place sush as 
atomic_check() and atomic_enable().

