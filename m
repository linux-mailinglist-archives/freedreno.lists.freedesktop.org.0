Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25CB391C7
	for <lists+freedreno@lfdr.de>; Thu, 28 Aug 2025 04:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E973C10E92A;
	Thu, 28 Aug 2025 02:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMLl/Xyd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEBC10E92A
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 02:37:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RH1gx6008302
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 02:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CzpcX1ydkh01oreyPdVhWuWFkuUt/DHhQ7WgcSO750o=; b=TMLl/Xydf3peKmCe
 3SJjXBy53cYoHckUs24pk4jiQpMdnIUK4/0lzziwMe9wGDQPQps29hwfZ8qDwG6L
 y5rwjPVEvjgE6p7nPXO85SsJR/2cR3NQOOh7snQGUiuMeaoO8DnwnTsWmwTmpM+A
 ov2U4t6uUfN162F7218VBxd+Tilqr1B05PSPzWwm/chUSlpouTb8jwCc9wVbe7W3
 zpTxbI6/NmX6H4KPnT29ocU03slHyAqVcgPQWgIOjPtyvcYaN8mkxavwy3wKDmPM
 YWE9yIcef7XVxNc/LGZ/gW0aT4BKSBtGvogfUKuFwJjfhEPeqlvUgrCEj7v0+LM4
 luvzeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8amvgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 02:37:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32559972951so120862a91.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 19:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756348660; x=1756953460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CzpcX1ydkh01oreyPdVhWuWFkuUt/DHhQ7WgcSO750o=;
 b=OfZElPE0ZRVQDe2KTA4QoxCzhufK0VX+/TUvaCDI6PcGEKMloZ2hhsmtZbknCD2Cer
 LpGWmWBCvaHbh0WqtDNN2e+lqvlH6apN+xaxaWAISOpIhbaP4bmQypt6ckuUsrKucw7V
 rqbI14tfCFRk7/8vG3hoR87hooztL2VVqlEurNAAyBgEJEkuLS22qgcIgewIsmraDCdP
 yb1yrmz4agT1dVQLBdxqZGh96DpBYbKooCm0kSRx9RpGdpmbCn4TlsI8z7mvxy5ET1k8
 Ku1FfQ8BN91dhYCtY1c1KlI2Q8X0EGQwdXYmdWbhEN4UeHsS25yoFRee0kizRKFYGzRH
 uNAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFtbvKx8CkqlpHRdze6XB3pDt6S7i7A1DEv/ZQlwfEti6CUBuUHRLuDCqGKt3Ur5PHNzpn4uIwRO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5Rokc4ZioQTIpOkO7spJJkYmo1f/Qd2Vm3wMVtdVukI6hNBzJ
 fEWBEv9zgzJKZ46j44ChA9eJJQpyfKNGmoIVHxgfGXHmimn+jrOcw2wwEeGkVpUJwsYwSwMNnOc
 3k5VWMKL0szILDEFtlm3znl9MBOn3UnRRjOtgaPI17E3RVAxKQoHraA8GRqXwjvEBUJudn5k=
X-Gm-Gg: ASbGncs5DhS1oYmpqcqtlpD1CnjWgijfrvKvcfxGq/vmYYuZbVZSlkwdkrlgRxE8Axt
 dp3GypNeejvJB/RGKQ/zE1RBwaj/+4Ucx+OD+9w0DGx7iCDxFbSUlTTt4s6CL2z6GmcALhg+YZt
 4CKQhG3W0TIyw+zCOYdyvGeDSxu8OVuHPFP9tQRijE4sDsXGZql/x9BjZ2/oeoQ55XquJmOymJl
 UeQQ1dsb0LUsK3n7FvYggbQ4jRRgW0aB8YO7BylPPMOKh+vyYFA1FrwppaumPsgpKVTfAEJ7r3t
 SBdvFcip86uERXq0Zdp7hIgG6NQNmFBBlWn50fF3rNmnU5VztiocTituQNan2EzLD0TWRUnYzCx
 5mMnaJQa9DiKJvm65q3RTuIDzyawOdg==
X-Received: by 2002:a17:90b:3885:b0:327:76b9:3c74 with SMTP id
 98e67ed59e1d1-32776b93dc0mr2682867a91.4.1756348659710; 
 Wed, 27 Aug 2025 19:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe55ZTHJRQToocxrNCqcxFeBqSv5AmBiOroCNnrtBkGeKvVOpw2UJG22Bn+GftHwdcq8/fIg==
X-Received: by 2002:a17:90b:3885:b0:327:76b9:3c74 with SMTP id
 98e67ed59e1d1-32776b93dc0mr2682846a91.4.1756348659166; 
 Wed, 27 Aug 2025 19:37:39 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cbb7c0e0sm12696409a12.37.2025.08.27.19.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 19:37:38 -0700 (PDT)
Message-ID: <31a1d952-eab3-4630-8337-94a45d144199@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 10:37:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
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
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
 <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
 <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
 <inxoswyre3qalrb3dj3lz3b5vmnpnkyy3hh4oum3z6p7yqlo2v@7g67yvvb25tc>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <inxoswyre3qalrb3dj3lz3b5vmnpnkyy3hh4oum3z6p7yqlo2v@7g67yvvb25tc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68afc0f4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cSqeRI19cUNuZMl-djwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfXyFMfwDs+Pu0d
 c62at9gNtedtjSh9NNMU5srMIrADM92BAq9rQxXh5HFVU7uMUZMDWr0HIWHjnKYJOSwOGbiq+AS
 uNKBb+qgmnkoDGA1TGlcdD5RCIUBAQJM0p+1Hld4ILiGgOvOEnLklxlaiGgsj5MfF5Id0RDyryt
 Fpt9XHUt5oEF0146DJ+7LevQ6GKKLHWnjqocDjdhRlj+Ux3XIkLs15jbols3WgHn01M7/eeKCOJ
 UOWqIF39LxqCo02Gv5k5TZCnt41RLpJtIBnaO48IHkM8IfBhxNwD6GE/jz35auSHo4oFJIC9iCL
 62zdvwOaTCzx9FMapOKgpqPFgbrxmyGG40qOWuK0XSz6ERYeCvcfI1RPF4d4Mgojya/k//5tzg5
 od8U3gaw
X-Proofpoint-GUID: X0S0k4MKU0w2KTzNq5daujcuw4Y98f8P
X-Proofpoint-ORIG-GUID: X0S0k4MKU0w2KTzNq5daujcuw4Y98f8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153
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


On 8/28/2025 12:14 AM, Dmitry Baryshkov wrote:
> On Wed, Aug 27, 2025 at 08:34:39PM +0800, Xiangxu Yin wrote:
>> On 8/20/2025 7:42 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
>>>> Complete USB/DP switchable PHY integration by adding DP clock
>>>> registration, aux bridge setup, and DT parsing. Implement clock
>>>> provider logic for USB and DP branches, and extend PHY translation
>>>> to support both USB and DP instances.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
>>>>  1 file changed, 299 insertions(+), 32 deletions(-)
>>>>
>>>>  static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct device *dev = &pdev->dev;
>>>> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> -	/* Check for legacy binding with child node. */
>>>> -	np = of_get_child_by_name(dev->of_node, "phy");
>>>> -	if (np) {
>>>> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
>>>> -	} else {
>>>> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
>>> Should not be necessary.
>>
>> Got it. I’ll merge the parsing logic into a single qmp_usbc_parse_dt function.
>>
>> Also, I checked the compatible strings in the dtsi files for this PHY series
>> looks like no current product uses the legacy binding. 
>> I’ll drop qmp_usbc_parse_usb_dt_legacy in the next version.
>
> No. It's _legacy_, it has been implemented in order to support old DTs,
> which existed at some point but then were refactored into the current
> state. You can't randomly drop DT support.


Ok, understand.


>>
>>>>  		np = of_node_get(dev->of_node);
>>>> -		ret = qmp_usbc_parse_usb_dt(qmp);
>>>> +
>>>> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
>>>> +		if (ret) {
>>>> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
>>>> +			goto err_node_put;
>>>> +		}
>>>> +
>>>> +		ret = drm_aux_bridge_register(dev);
>>>> +		if (ret) {
>>>> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
>>>> +			goto err_node_put;
>>>> +		}
