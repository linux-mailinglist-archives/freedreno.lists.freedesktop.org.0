Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF4B901D3
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1110E412;
	Mon, 22 Sep 2025 10:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK8+hF3v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D603F10E413
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90Gv7011598
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 //qK6wXZg3VBUfn/3y6cWL6qPfASe+TuJHYX2mofcCE=; b=SK8+hF3vd7O8Lkok
 QQzy0rGVxV80rkqb0+J65HgOtyQdcWLlD3vOxhhv10WZuEgLf3R3m/X32WC0JCjJ
 JgwHbMi5MCiP3W4t6183/UiCst1mplMxm5Gb53dPvydfSOjI/9ks13DF+VmtOTCS
 +yzH/r+Q9spXyOp4u6fmjGvm9be3Hs/dbqpAoHnrtzFUBc78NTGM+Iv9LCYpYX4k
 Foi88/C9kPkuJ7t+t2xERB/IwsFFjA2Fpzamllt+yLQDM8pV69utChBW0fAPpW2d
 W1/jEzh2xNRf9J8D9mo1LaVjT2R8z1ympQlmyUaBvIkkq/q7Oj0uErnGq3LtlHpl
 6PfKbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhmg5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2696ab1bc16so12120285ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758537543; x=1759142343;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=//qK6wXZg3VBUfn/3y6cWL6qPfASe+TuJHYX2mofcCE=;
 b=DJFsIJs2Z5kDmJMLbCBtFJIRYeuhwZbC5lqcXY1ML4c2m658rPl21wn+rk0lmJIbZ7
 OOfR/qD7LdwJDb+DOgNHINDW0pC7r8+C0Gky7XRS6b1wPm9xNDerEQQHL3+CYQ0sP0Q/
 bfBOs/4Xnqj++CBO3+TLlqO+qtjnJKfGGRc3tWINKX0EE5TgFNA2KCSRAUVznvH47q37
 nUzb3CoLOaMO5mLNzC8QQrKxU4D9AVoME12y4Ac9Bs9dokCrzoRzfDxyipOy5dJIycum
 6plgFyG/9MUq8H+M661PPS9dfh+GZjQ9PjIWoYeI+VSscu4DOTPdw4bEFYGkg1Foxd0n
 r0KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjK4hKAOkDDyeE9ITQrIC5AKYQxVQPnFCY5gWW/9HXRLOgZUj8PFuchQQE+IIoEMXPU+RbBvtl+Mk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyucn6O42PtGTNV59Rqa5IDzkDgSyYgccEmK+f8UmEcfM6KDKvx
 FFVh+8V0h1uN/U8OXSiLqaHlt3KOxrPEx7IFHuyAcbG2ksqcuurUUl0lOfrLMwtfqn20uLPbSdU
 MJYe6nIl/zNzwKflcT+38NbMZiVMcw46OcNg8WT2V940Za7mIORSxh68FUMoMDL7t88AIDBw=
X-Gm-Gg: ASbGncsM7CF26q/jJJ+yKEYvAixBOtDVUszOt4A/j3WEscWTAfe9/WJyJv87ZnzBKln
 zzzN13w1nuIjfJr1L23xriPAqPpemUhzlbVvxkh7tNtnD6h5CGiVCIY3poNxEPKk/3KJeYRJJEH
 EfKLRxIOJiVPcKGSmr4sDONU0wGDOuDArYXGgYN1WeDOHnkYC/NZMyqKaNB/pRRs0Oit2qF69uy
 g0xdC+qF/AQjCwPjmlEJ+LCE/L5Uhjd53fgJgZazeYH59k5ZgIyOW7r+dj+2e06KrE5tac1YcVb
 ngmnqdzz47uWsm6lmSPAOtrAPUULzuNZPuBfSjBq8HXbgy56ngjq/qCokBdHa857+A==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id
 d9443c01a7336-269ba5443fbmr57182945ad.10.1758537542552; 
 Mon, 22 Sep 2025 03:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ8EgA46Cot4VHvbFVkU1N3hyNZvluBxUAUjIVdbYP7UL9NYQ0X80HJxHmx6fYBf4OwquS4w==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id
 d9443c01a7336-269ba5443fbmr57182785ad.10.1758537542098; 
 Mon, 22 Sep 2025 03:39:02 -0700 (PDT)
Received: from [10.64.16.135] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269803611d7sm129020115ad.143.2025.09.22.03.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 03:39:01 -0700 (PDT)
Message-ID: <c95870e8-e481-4d3a-ba4b-b990381b3d45@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:38:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
 <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
 <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jfiBp7qTozoUjYPO_byz02OR2oP6J_hb
X-Proofpoint-GUID: jfiBp7qTozoUjYPO_byz02OR2oP6J_hb
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d12747 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=F9smdMtuN0WkDBw8KqUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfXx+kpJhoj5F4Q
 U1bNbis8KJCE3pEAschvWnXN450JxazUmcuM41xTN558VwCXlGtEv/GekyNnz0aSggoljcjz/Zr
 HQHeVfeiwnlxKtpx4nqK0UGs2f4bqrnXW0fMxf9bYOnM2TSmjGOjI60BsNzGfoTJnFdAegl/XHh
 iWhK/cakJcfztr9vm3f0RMTQGxzBePVR+vbkhHKsa+Y/MGY0eFp9F6aR990YsPOY9+tlEic6Qsm
 HP293W0X9WD6jHCIz3FBIOym+ZjrXZ369QZVNdAFs7HLIqr0vF8JhWClzn7KU1c10RcMES0FYNP
 naekjgYrfJXW+J1Q9MbEXv3CLvK63OBCLwb+d1KfMU8/j1PeiwgfHlgAnfZBL2Lt1z2/Y2X1Hwx
 YcLzQVi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
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


On 9/22/2025 5:40 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 04:04:42PM +0800, Xiangxu Yin wrote:
>> On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>>>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>>>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
>>> Why? Start your commit messages with the description of the issue that
>>> you are trying to solve.
>>
>> The original reset list only works for USB-only PHYs. USB3DP PHYs need different
>> reset names like "dp_phy", so they use a separate list. Moving resets to
>> qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
>> I will update commit msg with issue description.
>>
>> Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
>> using new attributes?
> You can't because othe DP PHYs supported by this driver will use 3
> resets: phy, phy_phy and dp_phy.


Ok, then I will update commit msg with issue description.


>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>>>
