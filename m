Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7169B8AF60
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F7410EA6F;
	Fri, 19 Sep 2025 18:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKcLA+o5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E3E10EA6F
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:42:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFGIGr019068
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X04daQs0/GOlbdwQIFR5tVab
 ojXc3GMFHaojbKi4+xU=; b=IKcLA+o5Fpr3sQxqhBg9BBKCSXhcI66u0QHDblww
 a+94BmfJz9SvdIE00ph9sTH6gB5RjBEHumfnAPQfjnQHKlmxq5XnTZsAvQOLGVjs
 6KBsDKSjbJpsFjMjLaw/qiKR/DKQIjNX2XmEigi+wF/xqCh763yw+ytvN/rpQyMo
 Z9YN7w6zNmA39B5GrPo/AUyDOxhYcmdiYMKKdN3ckv9x4p4cKu+tczpJ2xGtucx5
 TFhUZXhx5bKK6w8Ofij7/saDweOwwBCjTkF/eyG+j60rtjbp5Pl3hhdpAt+B+HZ+
 MNB3onauJNaNTUEe2JylgaaXyfpyFpQZn2xlveCVZKrt/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwkff3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:42:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8063443ef8cso760554485a.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307331; x=1758912131;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X04daQs0/GOlbdwQIFR5tVabojXc3GMFHaojbKi4+xU=;
 b=QCkOPDHLLKzdsMShw91Y95P1jpld3ad8tK0GcGKHvKc4tlfdS45UGZu4f8VP2IvlNa
 OlE6m4anQD9SNqezYrH5GL5EFwCh/tNnuKi63Ws8LNxzTdYZCY8kheLZobJZqMbuQFpG
 hvMZS5DNYVAuGB6nn1Qab2C3nnYqqGwMiCAqlLYh+OAT0ZOolkqQQ9zfViqcr0ECtaNz
 ZWKAxpL2fxkS3Bcr02wFeC2hp5Nx0TQB/NZyOHVrEciCBkTgImLwkhpvGtMf3AvTP5dR
 DbsarNdqz7oxgS9Bu5laVcGrkXskhYTvLnyXsIanpTTLfO/ClNwQQ5w7ojKtljFDWGxi
 sN2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2XofX9k+oNn4BvMJ5yR1TRZN2tXZIAKPf2IMmwk2M+foDgTNO4XzY0ud2Ra49CtIrvgRGoJxhRUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsc0qFyI1GVpk9XCi1qOrzHo3WSh4ZrZRo+HEttEFy4H1eYwPQ
 itTabnKTW6SPnOIi3Zye8WYiEK786RdUcUFjKYxnma/fd+DRrg57KZivaPlnCCyFnB5NdwRyDnn
 7a/1eDcRqcbOArluNOUvstqkyUlXdqVJnMyihhig8syLccQPfvfjKETpMtg/9weOIVDk5CehjiB
 pCkwo=
X-Gm-Gg: ASbGncun0TYhgMFu9QwG/fRNtt1AOS/E3F3QWtYd4NR7v92j66Gdk+qgSUY/hZUOCY2
 IMz5fozmSF7TzLT7Uf0mzeMIZ8fjhXQoO17tMUOcil6lMI1QPtoFRWetvcTM0ESgzKG3d0Udlll
 SUFrfaRQ6IA0Y2uLYVOFB0vQDKHyA+6COgPh+vY36X3Mt4drU9DBAVjBuJ5G3fDSptHt0IRKF7v
 Gv89ssZsY8JrQ558VgHXoa9rIDFzkzhaeVOWrYtavs9lZEbyq9t4Mj/LqwMgEsZUMhrr0bM4gPF
 4cwaoUODg6CymyrQm812R7xlwgGxq/cRLKgi4GfOjn1f5yIYs/ewSfeMXl0JqlX7+bbPT1xwZCj
 uBKfPoKJhZYUU0g8zzRUOxRCcun3efEJVmO7nKya2R06Y1DmANkxC
X-Received: by 2002:a05:6214:1c0d:b0:779:5204:4916 with SMTP id
 6a1803df08f44-7991578ca2dmr53799876d6.19.1758307329651; 
 Fri, 19 Sep 2025 11:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Tk/CHfkwfvHsGusufr2dlS6ih3vdDiyM2Ldlo0VTKbs973sYQp68Zd+i6oMsC0C4qDrZ3Q==
X-Received: by 2002:a05:6214:1c0d:b0:779:5204:4916 with SMTP id
 6a1803df08f44-7991578ca2dmr53799496d6.19.1758307329170; 
 Fri, 19 Sep 2025 11:42:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578f06bf6b0sm1360169e87.74.2025.09.19.11.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:42:08 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:42:06 +0300
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
Subject: Re: [PATCH v5 11/14] phy: qcom: qmp: Add DP v2 PHY register
 definitions
Message-ID: <bqgcuch65lczmc3asccgddt46h7ebcioyjs2pwsco6wivyjc6z@lehfge4cj3qk>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-11-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-11-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cda404 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=R7-NhU-lAAKmNGUam_4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1r9HnCRXQa3C
 g9Gpi/DtTOLOOeM3SD1wmZnV1fvcaoQrOaqDo3p0uNFub/FGO81PmO7xxpvm9JwsIbV2Xw1S3by
 6fPMBJBfEVh7Lb78dBGtQKW+OwIDENarlXiBl6U8L1VIy+eStsqtD62UeY2FwfAxyHzUZ6GaCG0
 ukttUHUu0znJsmQIqIlrXkgUgT3RzPD6bE8KzfwTPRyhBSLaKCCXfh2QQaIp2jcozD70RBYARyY
 UrGP0RefPW6tS1E7MpeQxf5CB2FQgiz5wZvXf2uPE3XF4IXBZDJ4rZ9HPTPFULMznb25CjIjd38
 wN4yByFRjzqtqte3Cn74K9LKoESw7wqBDtjKMNEZKrRg0kPbMCGiboCadPfmCVfHA2lDOPkSh5T
 TvuY/KQZ
X-Proofpoint-GUID: fagXtWfYJ372oyCqqm_VVrmu5vnsQZoC
X-Proofpoint-ORIG-GUID: fagXtWfYJ372oyCqqm_VVrmu5vnsQZoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
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

On Fri, Sep 19, 2025 at 10:24:28PM +0800, Xiangxu Yin wrote:
> Add dedicated headers for DP v2 PHY, including QSERDES COM and TX/RX
> register definitions.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |  21 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h | 106 +++++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |  68 +++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   3 +
>  4 files changed, 198 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
