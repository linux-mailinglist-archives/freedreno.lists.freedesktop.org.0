Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA3720809
	for <lists+freedreno@lfdr.de>; Fri,  2 Jun 2023 19:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63E210E05B;
	Fri,  2 Jun 2023 17:01:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD6D10E05B
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jun 2023 17:01:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352DwCdH020440; Fri, 2 Jun 2023 17:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+eDRdG0wv9kxJoJX3eP69VtTATObIOA4Q3wmv9nqeMI=;
 b=Ssecq0I+7azMpP/iz5OVudX/ighoYUZHNRfhEqRaVhpMXB+7T5d8nordE396C4TvXgVK
 c1GOocyigx7HN3H6dW3AnRwbPcmi6/5i1Y2eXyDQp4/8z7FKQBMxCZ4BOAwvDqd8r46I
 npbSJICsBfkXeEBlcew1lQOUHm0jPdwTPfEmMuCX0kledoyhNa+bJa/c0YxWiRag8THB
 bfGXUDQha1aa8n/yE8sWcNT7M2ikX4c04nxyTnPHYOdqJ99UcellkKFI1lche2GI6J13
 0N4IiQi+lai4gv9GP78xc6xwIILanL07EFVI8xslWGW53HCfvpWpQi2pgRTpcXvNPwyQ Yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qybqeh9q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 17:00:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352H0T7V018733
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 17:00:29 GMT
Received: from [10.110.100.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 2 Jun 2023
 10:00:29 -0700
Message-ID: <32aa41ee-4ab0-0915-a77f-5b0d6874b3e1@quicinc.com>
Date: Fri, 2 Jun 2023 10:00:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
 <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
 <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
 <d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com>
 <CAA8EJpqzyYQAg+VXLzttan7zGWv4w+k6kgS2SbRo26hFZ_9Efg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpqzyYQAg+VXLzttan7zGWv4w+k6kgS2SbRo26hFZ_9Efg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vYmShdBB0zFpAKRk8ccVl8Y9xIXOgU0t
X-Proofpoint-GUID: vYmShdBB0zFpAKRk8ccVl8Y9xIXOgU0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_12,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020129
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



>> There is one option which is keep current
>>
>> 1) keep struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi
>> *msm_dsi) at dsi.c
>>
>> 2) use  struct msm_display_info *disp_info saved at dpu_enc to locate
>> struct msm_dsi from priv->dsi[] list (see item #3)
>>
>> 3)  info.dsc = msm_dsi_get_dsc_config(priv->dsi[info.h_tile_instance[0]]);
>>
>> 4) ballistically, keep original code but move  info.dsc =
>> msm_dsi_get_dsc_config(priv->dsi[i]); to other place sush as
>> atomic_check() and atomic_enable().
>>
> 5) leave drm_dsc_config handling as is, update the dsc config from the
> DP driver as suitable. If DSC is not supported, set
> dsc->dsc_version_major = 0 and dsc->dsc_version_minor = 0 on the DP
> side. In DPU driver verify that dsc->dsc_version_major/_minor != 0.

I am confusing with item 5)

Currently, msm_dsi_get_dsc_config() of dsi side return dsc pointer if 
dsc enabled and NULL if dsc not enabled.

Should checking dsc == NULL is good enough to differentiate between dsc 
is supported and not supported?

Why need to set both dsc->dsc_version_major = 0 and 
dsc->dsc_version_minor = 0 for dsc is not supported?


