Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD22AA87C6
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09C10E2EB;
	Sun,  4 May 2025 16:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnA4f4aq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0725110E2E9
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544C0KPR003359
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=HnA4f4aqSTGjwKOb
 Dm7vLbj/46k2CAS2BXIF3QnAySBj1MkUoq9Ke52uq3Djd6NYKVmKZ7UYy04UFyb/
 wnIYMx3iMQBCVUk0AuiEQoZkDDtiROZEbyH5xE0sdCFXouASd+UtRVlwto8PY5er
 w8lBtFCDM9B4YvW1NrZWPsIL6RcJy0JfmlC1J96JqF4+8vFsG9l4aVxwK/qm9lLf
 qZuBiP+fQfa2l34JmPWLUI38drmgh5FWAMtZKB2/OZPKbFB9uBIjyqYcUCLzWW6/
 acMx69grj90RVvygiKE4BgKTa94LveXtrYIu2+L7EwZUzMLhbazoLLdoKN285IJy
 Up1cIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5a6f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c77aff78so337554585a.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375236; x=1746980036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
 b=GJSOm1YWsrEpaz6NVAjO6rcrrzwjxJGcEDjtusYGaAlmSbhdZhsmS4Db0YDRhZdX4r
 3YwXDObWgJURmjDIIcRGTPDUoSOOs4YD7OfMfLvd5wR9XpgssNTZFCFLmuA9GwU9LyWI
 E1+FG/YaWajl/ETsAdfaAnG00brmqerZ7UmzwbEniiIm5Fzn57qKUXmayUjeqk2RV/Fv
 VwTiggTlG7GPee0vpF6V8uMq5ab2KJBk/rsBFeS486nsEGBzMK+of16+lPrTlZeDvf+9
 7z/VBYXnrdTOPVBupP7GFrpzZVsniad9g81p1610sIiXwZ8cZiG33DUUPZ3+Ot2yWIgb
 bZpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSMzTHYGu2y+aOOL5U2qOYGqZusgnyG8BLjiedP/Ununtg84uMSF8pl8JBdNQGc6nHwvhsy/yJFVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7q0MvQooRxBYrvAqDx+3dtTkBArCPVzD63xPdq2EJ7HpE5Wto
 6fsfsNj2HRhy26wQH3B1aMr/p2P8+pNrSZkkJeotHnpV4AGXw8g6E+Su6IgsWydIV+oJOVDpEKG
 NTZuFZDmEUXHS4+hGob1p9m3S5BvB/bbXGMf5Q8X5G73fSIURqTpt5pNKgXwCrJcCfdg=
X-Gm-Gg: ASbGncvlfYCdsBMlckOKESPUJg01t4h1HXXLhu8Atglh6e06RdU4lBJpRI+tt0/WjMR
 qB3Ym4WcY6N1cl0bBPWmP6b5j7Dhc5Xe9+T5z8CgZvqS3y7Oe34f96S6WBLGh4s2FKifRSM60PE
 VN2exM5EpZhgjOE7S9Or+rfDTPMXPzJ4hEhgB0eK5mN9sH1gn+9KEoK1v31NAQPUc69Wq8Md5Ti
 8QHbwCNBmMKmzYieSflyXwVC0Vee4DtGFdjLc+cAxFwTB9usp1xJ8Ofqw+D7nPuzH3xqwV8kgWb
 6sz2vZFDByasvkGVZspYUKcxBlfAWRFrrD0fugPidRPieWwplqLCs/7S5ldEwfBjk7y+1p1iUUI
 vAUof1N4I1zbCkOCBAhXZDGl8
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cae3a926c1mr607137185a.18.1746375236098; 
 Sun, 04 May 2025 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESd4V/tl84ujiy+ueBS1wdjRHJiBAwRJzy9189FWkkAARUTf7JATItoLt9gDMWQyef3WGC8Q==
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cae3a926c1mr607133085a.18.1746375235745; 
 Sun, 04 May 2025 09:13:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v5 00/11] Add DSI display support for SA8775P target
Date: Sun,  4 May 2025 19:13:31 +0300
Message-Id: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r4HQ5MVjm5MXL8ou1ZLXzqSx9p0AXLos
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68179245 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: r4HQ5MVjm5MXL8ou1ZLXzqSx9p0AXLos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX6g1eHq2Z0fms
 wZ0MvbKdpd9+NzwKYnR7ruE/odEGqn0pWaE+9SNcFSDg8EhTqEG+XyD1uoGNmS1dnNzXMyxza48
 9TXw+gJuh8uzDQEB6+STDNtS4l/43DnikCBxjvpoP/6d8cXRDUQtGWsLGH2g3TtVIQUMTR7rGcm
 Heroq6Ll9fWT3LTRqmZ8hhbY0PJlopmMF3pjYxZMuqBn6YcfzWgJNyyvAVF0/B+ITHp7P4s6zyO
 c25QwPQK9QbyqroCRXh6xg9r1U2LQFhZrG0wP2J7bDASIB7MAlUb0vdJKisqXBJjBHOe5X0wAx7
 PMbUNxeQiI/tSob4E2f61aSyrBBQNhxhcGnlt1r5/I+vHSBCa6p5+HW9mltnoWvCf9cVzI+EBmQ
 VCyy1to9Q/hH4K2BYHUm0zBtgfjMWg2Oft/BMpBNt5bICt5RPE25EXlvoGQ2GHXVIRGgceT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=941 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Thu, 24 Apr 2025 11:54:20 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[01/11] dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/850e13b65e3c
[02/11] dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a0195b94cbc
[03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f2524f4d5e
[04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3979192fac5
[05/11] drm/msm/dsi: add DSI support for SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/249a965c3759

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
