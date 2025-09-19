Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B3B8AF8F
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D59610EA6F;
	Fri, 19 Sep 2025 18:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ocbb0xK4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616CE10E255
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:49:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JATG0e012210
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1xZa8NKZpDGoqnGXensXWLoa
 +hUVxbdOY1y1b66zJ+E=; b=Ocbb0xK4Ljujs9Rpfrf+140ehslrxIZaeV5ZsHXA
 sdEMwZoFTfb1Ql+BuaLOuDI/yc//8QfcddWVzrrz6XZzs5l52mLhX6M6HOZMh/dl
 /AoK4LDROWC8q2OdtxEBsFupe2CEPy+PAG6UOj3XCgBK3t8TlA4VIxHHIe4xuPbK
 wyy/EkBWHD1qo++duSE1fcHFjLQHzgsV9sQYLrzRdsnq4W7R+rnHpU9/2mg1muZT
 TzuoUhs8Xc6phG3Ve2179+Kh+lSmOFF2hLYBUmnUEtTIWt3KAygpVBwq43chfh3Y
 XsIAAwZTWzD5NTg8AKs/WIDXuyPAiS9QOzRg2awX+Eg6iA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyuhmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:49:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4bf1e8c996eso31101261cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307743; x=1758912543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xZa8NKZpDGoqnGXensXWLoa+hUVxbdOY1y1b66zJ+E=;
 b=TRiFK+tFet1OFq2yKa3y72BZ/n89EzyGozI+tdVy/isku1NvkLawvQghPKe2vUnZD8
 2G6XeDy6fzbluRgDk3uMgTImRZ3vXicM7TJPc3XUicYW30vuZzHSu/cA6utX8kaDnp74
 9WPpKOkU0GVCTsOVmKMru0d6NQoryd9CX2c4PKQit3fc3Nedp5DXYaz2R4AI6rSGKtQL
 YrmDw/R2lbM9Zq/8eVKEwMSTY0Gf1vlemzZ/aQTD/AgrRXfFXGGollaGwwRIL+9HHmbs
 gPmKaiM+zc9KfYuG7Ds1Oq4OtvXd/3My/muLBKW1RjCdKoeZ60Y81b4qGU44xh8UWuro
 JPuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNAyZlRojXTxmQ5LuAmaaLzGvv2oC/R7rBfcBtD1tNnn6eCd2wYjmzezSmEyicQ0qTeDnQS8NjogM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcwYlVXxMG1DgMj964V4v2GDkRCNmd50DkczZZ122plWud5dw0
 RDZe55D2MRu+BuUVmpO63EMDiBL24cn05+XSypn3sZRCvGJgdd45vf+32JvbmOsDGVkYlhzftE+
 0+Uph2LVAAXUw6NpCz+wwFOmyqzduOyqHpEIgLIsbeCUYNPSt827tLrRxq9517hhEne5jToo=
X-Gm-Gg: ASbGncv8ufCmexGNkOFLwZqhali8cb+VKDzW6boh2WDwmk+lCRXZddGJzqMLwI9icnC
 dT25O8e8swVUznCHCaAWq9MnrqsDerW7fs4rq4+HXTiB+jfUonIW1EMxGmmhRrSrmTUAcjY7H/F
 LYbVrOIPFUPBzJ/BNdb/isrbQx5pW8CpfLVfQIbW7/s9LfdOZ/d2v2DjJdYTwGL00eu2HvObKgb
 N+pcVL6KODFHxVxztzcf7Tns3YLzHMAU1C6bJ+Q9vulatoub6Sm7tB3fjo11+m5v8tZa5ApU+96
 4wir1MGRIw0ToUF3i3OQjLEI/V0cTwHLivOQdV6n45/UQvgvi9kldwDqlocaI2ccfCFGV5f8NN1
 BAYgzJcGP5daRj+crE2cK4LsvE13twEp5c1j0YRMoW/G5L6uHX76f
X-Received: by 2002:a05:622a:551a:b0:4b5:dd8c:1d3 with SMTP id
 d75a77b69052e-4c073d929f7mr60166781cf.77.1758307743365; 
 Fri, 19 Sep 2025 11:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd704pWx6mR4liYWHfvStigqH2zSqR9FouEegfxS0MAneRfE6nX5yLKo0d8lSjuQhI5Fty2w==
X-Received: by 2002:a05:622a:551a:b0:4b5:dd8c:1d3 with SMTP id
 d75a77b69052e-4c073d929f7mr60166031cf.77.1758307742681; 
 Fri, 19 Sep 2025 11:49:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a9e1d901sm1499917e87.135.2025.09.19.11.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:49:01 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:48:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
Message-ID: <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cda5a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0ERirU_vq5G6WO8xEvsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: sdnipU0PEBggs40c6__J72SOYfH_kSBX
X-Proofpoint-ORIG-GUID: sdnipU0PEBggs40c6__J72SOYfH_kSBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+2qOaQZGW6yG
 jmcQFl5m5Ue7/dQNXhfryK1QEhZsAuqipKKy5z6Ki0F5zjzNYjBkttWO8bDeXydh3J/0ZW5KhQ3
 l40P1oAgu3IORNWktF3YB0O3YfGiMyzI3cUSel8hP2goAI+JCEN0gV5Knq+T1wXzvFQ36wggkce
 gYlJwPLpLr2XH0lTOio/yKncMriHadipI+cdjC6DGMuV9FJbgY/cjrkyeONJ5azpgRVWZG1Ysse
 bfc8S7IfWj5Hbe/1MXPwHpHr4poKLH98yvtFdi2+rqgBTtOC3Z5EsAQQo0NeQLMVkfforzcs7lc
 jHKT/WDecry9amXeU9koX6fkC9xe35uRwcSqg3IX0dobBhsjUx3TrjxIFqa/nMXwAQGaLfi+4O8
 m9tY13sG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:24PM +0800, Xiangxu Yin wrote:
> Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
> so it runs only for USB mode.


Please rewrite the commit message to start from the problem description.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry
