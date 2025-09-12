Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEDBB545CD
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 10:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A3C10E152;
	Fri, 12 Sep 2025 08:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGkDy38r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326710E152
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 08:46:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7RwMD027099
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lGDrGSwQe5Wxsvo3kpmlzGmuY1iFtGQeQKswsFIUacE=; b=EGkDy38rYrnjaKFW
 5EWhmMA0KGDcOE5BcF6+mohdOrto8vCfS0ZsLlPcGzGjvyjjFExh3s665KxQ5Kfv
 7keM2U5DyWmGO1hfmLY1tpbCn6jkw3YjiF2pqc9eU59reSEAN7Uo/HSC2GFlcnyH
 ugju1T8lvtHcRBLmNTwEyMyjC2hmNjRPrLSU+4d5xHWxJjYdcqzLCvh5iMrERuge
 puJUZB/mpPQjhXCRVLZjTPTIutQ1hyuq8p9agGlSZ0chJt8WkGakoQVd+LWjpTbF
 bK+D054z+d2HDhLcNEDFqx8SS/xGdHJ2M/zKo8HtG5IytIX/zIxvxaNHf7/JPO5t
 WejYQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h5vsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 08:46:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b604c02383so7895921cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757666787; x=1758271587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGDrGSwQe5Wxsvo3kpmlzGmuY1iFtGQeQKswsFIUacE=;
 b=JFy6sAJrW5/2ubexFm5JEmgX43zj1HFB+J50gGqIkt5fJJrSVs09es6VQUrjVjSkmG
 hgmWwqLuvBW/LO6rda7aV9S3Yw9k24MA/tHn+SamCejWzUm90Z04GDk7aITaq5N2TBFF
 hiwFP3pMniQHaGRvg28UbbRvgsz10z5UwFuyRd9Liaow1FE5uw+pOyEVsSH/4ivOeXx7
 zVpflBphnDDzXN4st1td90LNU9Yc20QZL7M5Vq1pGSVJkZyiuJX+wPX8X2EIWAL35c07
 1yxRHn6feF84oKArQ6e51DcyuieOZESnxgeEa67Fg6v1dqy28qiaHe5XRce9adJDEGG5
 iTzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5MR3/PPwJi7OaYfnOx0h6gbXKFDHrr5Lwajcrs7OnQB8rdPW1gFKPOJ6jd8HqlvFdIYNZJS2Mq2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYMGYQJJEtpWdpSqKcPJfnOOtpyHVPP5nwmtyhxJBOvTqNMtYs
 85JnMHohWsYlvumZpLWewsleZacBQtWcFA/8tti/UfxAG/yAp0cTy8kOboydJm9i13kTfEt61Xr
 86+qE62amxdQ521Ina7pqAukxgZNJVdk/1M/obONEkj2pINdXJQkxdob5ufUkwbjAVWPOvQM=
X-Gm-Gg: ASbGncstMXMQ7WrNOZK2hAxvbymUYNWnCTcvprhcTORT2uM2oanJET8pbOhmfROyuhA
 S9zGK5/pywSaeeC4uP8b8ZjpTi0d2xx0i+0TcSImG3vYGUTaV1jN80+6f7XiDgqEoKFCkh8JiXV
 d/snr7YoiEM/BwYJO0MWxfu0mifDiPsFp0nQUvNcs3RjEB8Z03Ysd9jYTZqk/ewOyZnQgnvEqma
 PXPtXkW5Mruh/qEOYzIOq3VWSPFO+MaXniT++K/558QNiYhl/OBtAWUB4PxTw25erEykI7ca2Pd
 sTaBH3UB+c2hxPfTG7xesnWG0iLLVhI5Dbob92aRCtEaZxD+cUMvjT1vTvCfHiNWTgpuK/icUxq
 2f8+9JYh5wq7t7u7aK9+JmA==
X-Received: by 2002:a05:622a:5ca:b0:4b5:d60c:3f33 with SMTP id
 d75a77b69052e-4b77d13a75cmr17660121cf.13.1757666786803; 
 Fri, 12 Sep 2025 01:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+NVmc9TA9PDMivtFQF3GWnTURuIOA8rik1NCbnbvalHLcjpoipS/fO2pMicU4DnVEo5yPGA==
X-Received: by 2002:a05:622a:5ca:b0:4b5:d60c:3f33 with SMTP id
 d75a77b69052e-4b77d13a75cmr17659811cf.13.1757666786285; 
 Fri, 12 Sep 2025 01:46:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07c337e785sm150379466b.25.2025.09.12.01.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 01:46:25 -0700 (PDT)
Message-ID: <274b27e6-ef43-4597-a7d6-1f948f2e6c5b@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 10:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
 <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
 <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wJb99o4mmK-lJnr3OBnELxXUMbBabSri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXzcg0qftPhmnq
 3hYiVfHT+rUDsC8Rvv6qFiGECsoIWaYq8AKIKEUi2DhB1cxDlCP4MKcnpimb6wOYCVdcnQcEtH7
 KfBHfntSxk54vdpIh4j7YK2MKlxNyaB6y6E9zpXxj36SmKKSGKqP4PvzvZE+K+N9BSHu/9s5b7b
 7VKttBZN7iWv7ESsU9KN4awqgksrDNvXK99GUFcqZQ+3Ec8nqNfV3997RHM09zMv4Xuwb9NPEzS
 MWFgKX8OXYQ8UEzdHZI+oF40xx3/1Ex5BUbWbz7r6+VAkh/8mRQgKU+zkK3gynkw8X4TZ3nGnkM
 YMTsDcdz9wxP7XGeisYBEDAlGmIYaFX+gCFtFUQA+sdg/Aqvsln0OOszmCkFWUYxywFNlQALjAG
 n1CPMKas
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3dde4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Y7PaXT35z5vDV90y7_UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: wJb99o4mmK-lJnr3OBnELxXUMbBabSri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
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

On 9/12/25 4:15 AM, Xiangxu Yin wrote:
> 
> On 9/12/2025 9:24 AM, Dmitry Baryshkov wrote:
>> On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
>>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>>> including register offsets, initialization tables, voltage swing
>>> and pre-emphasis settings.
>>>
>>> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
>>> platform with its USB/DP switchable PHY configuration.
>> This should be the last patch in the series: once you add the compatible
>> string, it is expected that it works.
>>
>> The patch LGTM.
> 
> 
> In v3[12/14], the compatible string was placed in the last, and you remind me
> will trigger unused warnings for the earlier-defined qcs615_usb3dp_phy_cfg.
> So I merged them in v4. 

The intention is that you can do all the preparing first (which doesn't need
to include an assignment to e.g. DP tables, since the code operates on a
pointer if it's non-null), and you can push all the platform additions at the
end (both tables and compatible in one patch)

Konrad
> 
> If move this patch to the end, patch v4[07/13] will hit unused warnings due to
> missing references. Should I squash patches 04 & 07 and move them to the end?
> I'm concerned the resulting patch might be too large.
> 
> 
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>>>  1 file changed, 141 insertions(+)
>>>
> 
