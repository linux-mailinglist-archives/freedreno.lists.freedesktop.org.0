Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E27ABBF15
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 15:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02FA10E235;
	Mon, 19 May 2025 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7VCfql2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BA710E235
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 13:26:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ZuYD020271
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 13:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oGkk5uPJENlcrR8ExGnK93Az
 4FZA48X1UVpf5g9eL1k=; b=I7VCfql2kc7qjAhj9U4Ib2pC2SRvhWpc50xCFtgB
 FZEbxxfJw7SgxZZY3MV/GJ6hS0Qfq8uC388znSM6gF+ciCv++FeiWFZP6H+axZbP
 sHQCInrP5gs8hJBIK0M7tgN4GgofOSI8Q5fXWFIgA6P4cbNCRkRTPLGXH3cJbjrA
 8X47iE7CVVWug/XC7DOs8I7+cJfDrZH53KkwJHstRaMHM2r0O1Hefo2N9ou+OmPG
 zE69BHQp7mLZbOP9pcQxWsQos+tybqsG0Neot7lgA09Fs2Wln2+yi1jpxAtYB5sS
 vggNG1t/KHaPtgc8vQZcAjXL5qahu+8DEa7CmRzoU6UzIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vfak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 13:26:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8ae49fd37so69589206d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 06:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747661207; x=1748266007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGkk5uPJENlcrR8ExGnK93Az4FZA48X1UVpf5g9eL1k=;
 b=LREz+v8LehdFbL5i0CsDIwIcXjEJdyGmrrcI/RCS3oMEQ3M2ceoYtW2HS/IVUnW6WX
 tUxUEcMlY+Yy5Pntj2nF9asyEpFNlZbgwIDZDUbOMK9/YbOsOzAVf5F9US14nvZdYzF3
 JNH/ZprCx+oWFNCfbuRyFrMj5Lu7kjU/wr3zNk3WRtWTN7raXS0Wze+lkQwJGi1LhfFq
 wThgboDEK3bch59ry1m4gAIBZ6UVrvesgggDiIWVwpMUaczDsp5wH4PHVyxutHUXRp3G
 Stu+3hES6PjuV7YD0Q9bVp0wGpDSX7l8ggecjEPrcSjBQVDL23MmBs5bHw86WX9XqYkV
 kvKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwu7W7R7Pf5E/J4zM40L66MkzrtlvMe8KVf2lK8TT7DMbyMQtppBlvaF+xAI7ImoFegMV8J6MCAI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQBQRfD6waXmB+7FJhco3oD61LS2eFOubcWUN6ABc7cKd4QW8o
 8EqvmvM0CNSMCYrsjVtRhQWW0lSw6gFGSTdtuZjIeuQ5FUMqsf2En+2HYMiLIV2052scbojDaML
 SFqp35LENb5vv4riMxZmr9vLrk4GLc262XCMLd5puX/0sRU9cNOKMl4Pxb02tFF9Dh2CCIRw=
X-Gm-Gg: ASbGncs+24q5rBAe2v33YXFOlIIvuWrTzHsWX7i8V+9oMmHuUkWRr6LF+N3nXh9CJr2
 AHK0h5tUF+nB+GEJsmUyKrFWlUDUt5zhIWvhGS0pZvWqucqjfgbEsDOSFwcbH8sLKCcmSdQlgZq
 k6VbEYXoFgtoO8HozsH9VBXsoGB6oWe0gK3LqaZwKrTmgWUeokU5QwjPtt93DJGw49mMvPXFGmi
 +qn2znpND2/V1NttFetwRvOfYIp49rJjwES/384gjRkxDiOzkCRNabUnk2e6eb/Di8ZD9wav/QF
 YTNnde2J7JHBwq4y8UD0oy/xDE91ySLXGOeQav0yGQSNDFjmJUJ48CQZUK6iSnx7C4BM2TN/KMU
 =
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id
 6a1803df08f44-6f8c53f0bc2mr146769586d6.0.1747661206770; 
 Mon, 19 May 2025 06:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0aOVnc3nCtR9lGsacqR42oc4D8WjdNAyfE+YftMATKn0uQn4ucAG7wCIoSsvdjD5bfEC09w==
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id
 6a1803df08f44-6f8c53f0bc2mr146769056d6.0.1747661206344; 
 Mon, 19 May 2025 06:26:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084dd21esm18791861fa.63.2025.05.19.06.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:26:45 -0700 (PDT)
Date: Mon, 19 May 2025 16:26:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <4cjz3wu3osafi7sffluslxea3e6vkdw45usg3djpclw5lv4fvg@ofoqbmwjdmjh>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
 <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
 <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
X-Proofpoint-GUID: DECIqTB-jTrJ1LYaPV-J3sVjso6VTt4o
X-Proofpoint-ORIG-GUID: DECIqTB-jTrJ1LYaPV-J3sVjso6VTt4o
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b3198 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vtArrIq1twOU848iWwIA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX6mB+edy68nWi
 Bwj81w7BLGf77xqc57fJPDXxPWv0UQ1wAlaeb+iLdB1iZS0sKA35GJL1tNHBYoM/AjtM7o1b9HQ
 Q0iz+UTjNJNsMySh3fj25c/OfKb8/oE5n6VqnLN07zkVKQqG6CcMF6DeLBnzIWAu+s7wKrsw2iZ
 rpWEuyDd1EEHsLcRbAmlVhkaIPbtGaL4Hlj5v0KSJXVlNrSnSjZqTFS+ZlrgqTxaiBbc0JVD9Zo
 NTei6KHkGGS8fMXoG85MH0c5Jt/OIvLKijsIeby2BHW6wjkzZ4qO+mnRDqzInBabrq6LgfgWLQP
 Ne4Ql89P2EkBjxyi1fkau9QMNvBTk2gKvhPvd/g6iML+pd3uMap1qEP1rZ55pFh/RRj+v5JxMMI
 G1kCzIGLDsuyUc0rPOWSg927x1ZM6aHqwIFq/ewv4gGIP63B8MHoG2UDIsM1kxDWoW4i/WHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190125
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

On Mon, May 19, 2025 at 04:30:55PM +0530, Ayushi Makhija wrote:
> On 5/19/2025 6:31 AM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> Add device tree nodes for the DSI0 and DSI1 controllers
> >> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
> >>  1 file changed, 185 insertions(+), 1 deletion(-)

> >> +
> >> +				dsi0_opp_table: opp-table {
> > 
> > mdss_dsi_opp_table: opp-table {}
> > 
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-358000000 {
> > 
> > Is there only one entry? Usually there are several.
> > 
> 
> Hi Dmitry,
> 
> Thanks, for the review.
> 
> In the IP catalog Clock documentation of SA8775P, the same DSI clock frequency (358Mhz)
> is mentioned for all the voltage corners (svs_l1, nom, turbo and turbo_l1).
> That's why I kept the single entry opp-358000000 for 358Mhz and selected lowest voltage corner svs_l1.
>  
> I will address rest of the comments in next version of series.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry
