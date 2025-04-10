Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44DA83E33
	for <lists+freedreno@lfdr.de>; Thu, 10 Apr 2025 11:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E7A10E810;
	Thu, 10 Apr 2025 09:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBjjiOSD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F410E801
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 09:16:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75hm4030646
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 09:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/NI4HaeWdHG20yTgWgvdAsga
 B/QNYBVNAVRuaUYyJe4=; b=dBjjiOSD0xzRRsCKkHFO3BiTt1gp1gMlwu7NcCea
 wn1eKWRBYcX4S3JyOJC0wP6aje1NUF6+kzFxd6C21x4cAvpEFAzQeIfd5QoWzSzO
 4lgWxkDfuQ45s6XRLsgClUk0I8+fRoURxQQuEqQfs4O7QLpYDTdOb/3YXDCIWSmi
 LI9PdHN/uX8aaWh4PAa+CUqw9eM4ed8BrqlG3SZjm1IONcXsUtRu6pLhSL9Esbx2
 pPDvqctjuLyKN2T3NSakRTPfGep6b5FNRQr9AX8zR9vm7ezPgoliTjLovyH0E4gq
 DtL6tqINPp3Qg12idSbsT9Z6RIAxnU9Cw63V7WUis0+xVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftp65h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 09:16:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c549ea7166so95352385a.2
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 02:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744276617; x=1744881417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NI4HaeWdHG20yTgWgvdAsgaB/QNYBVNAVRuaUYyJe4=;
 b=wzS+ZdT/sKCkHPNGx53h2+DP8XClm3ObDBDuxqzrDvzSskM75nTv6t+ttvgOmz2MLe
 S5awiUlXZoFboeHGZLt8D5FsQZgIiTL0pOHlVu2Re4GH0WUJNf9em4wEawCQUibMj4JD
 ZroR4GF6vQtaideAIfcVnyi2MPklfP+TCEjcST6XNnnBZKz56yByBk3r62I6z9VX8ubc
 gTre6hvi+HpC5vvqVSAqS6+dyFAA8gjQbdIVDO8gp0W5Uz6WDRi8palS3744aqbZmD/X
 AlZg64Md31rZYTWoaeDB8zmkl3G4hEeFd6nGrvRSLeDVj8ZgGSVy3UpkJpBiX3iKgt8d
 9r6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8B8nzqlzbmJaqsAVE+oycIsiUh3HOYzeG50Uc0tkq6Eczt5TVJUFBhCwYM++g+9kRXT6Z7kJqzZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhQqrC7NInDc9mdefLzkeCCIUb5U5z4h6jbCtAozKaDbRXt8q/
 jMZ7svH1SfphShTH7beW08U9FGz7C48+AibhcIHYt9YDt4eB7pEYlHxQLUepxYhpv2DR22USBdF
 HDIkHy1/dz8cqQN/1L1aH0Hf1pQH7fA8avHIP9yjN6hEW7xinSSaCy7na76zR5nSsWec=
X-Gm-Gg: ASbGncswbj3ZCk8AWnxgC2pbrGBakLS8wfQiORDcIDTderg+iCiVJsvGrtK+bZy6iEL
 aG5kJQwiJraotzbRVIrmQaZQrbiWos9iCaPGuQcMKlvxu3foNK/OQDvpwnlFLGb1BWi5cSG/iAH
 Q+YaI0oORI7O4lqwZ3cv5trYDRPJm5qP4YbSZG0BtEMue8ynZOkGL1m58hZ0B/5bPksGwkOoCNf
 K2EVHN+9+JoPJnPJZ8TLT2T3dytHdYh25Q9OteXIwRaoSsDBXMEEikhz3xy2vg7qnE7cMgwOcTe
 6/2OJkNl0IknfQyxvL6JqP2obyc4tWcXiE30Pf4osVR7gnh07SRMLPv0do0WpmpAPgmNYdM0pXY
 =
X-Received: by 2002:a05:620a:171e:b0:7c7:609d:d223 with SMTP id
 af79cd13be357-7c7a76bfdf6mr244707285a.42.1744276617607; 
 Thu, 10 Apr 2025 02:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvugvbzG1bQhMo5tx4WT5oAVkdX9Zwn/H4ZbJ4q7g7do1hwxxuv+2Xv7nYPcjDjrokpnPXVA==
X-Received: by 2002:a05:620a:171e:b0:7c7:609d:d223 with SMTP id
 af79cd13be357-7c7a76bfdf6mr244704485a.42.1744276617283; 
 Thu, 10 Apr 2025 02:16:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d812sm4115651fa.11.2025.04.10.02.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 02:16:56 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:16:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
Message-ID: <vw4qkj6wtets6dx4irslusnyz2oztjljymzzcmomqxlcphxnvd@gpxrdgzhu5xu>
References: <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
 <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
 <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
 <767e11cd-e338-4e00-a8e7-2e15f3da84b4@oss.qualcomm.com>
 <04d90c1b-1b73-4b6a-b7fc-351754fbb16b@kernel.org>
 <bcc44dcc-8b8a-427a-9a38-8dc6d59c13e3@oss.qualcomm.com>
 <bfab7272-5a41-4072-82a8-0f7401b2affc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfab7272-5a41-4072-82a8-0f7401b2affc@kernel.org>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f78c8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=mGSTcfrgQxl9XoTJgfIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oVuQoGDtOxzWtsThyMg4AMlRqJVJFtq_
X-Proofpoint-ORIG-GUID: oVuQoGDtOxzWtsThyMg4AMlRqJVJFtq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=856
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100069
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

On Thu, Apr 10, 2025 at 08:08:17AM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2025 17:24, Dmitry Baryshkov wrote:
> > On 09/04/2025 09:07, Krzysztof Kozlowski wrote:
> >> On 08/04/2025 22:26, Dmitry Baryshkov wrote:
> >>>>>>>>> +          - const: qcom,sa8775p-dsi-ctrl
> >>>>>>>>> +          - const: qcom,mdss-dsi-ctrl
> >>>>>>>>
> >>>>>>>> Drop fallback
> >>>>>>>>
> >>>>>>>    
> >>>>>>> Hi Krzysztof,
> >>>>>>>
> >>>>>>> I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
> >>>>>> Look at SM8750 example on the lists. Keep only front compatible.
> >>>>>
> >>>>> Why?
> >>>>
> >>>> To make things simpler and shorter.
> >>>
> >>> I'd prefer consistency. Previous platforms use qcom,mdss-dsi-ctrl.
> >> Then you should have objected month(s) ago when Rob asked for dropping
> >> fallback and since then we consistently drop it.
> > 
> > Well... It's still not merged. is it?
> > For SM8750 it kinda makes sense, because the clock handling is different 
> > from all other current platforms. For the existing devices... I'm not 
> > that sure.
> How does it differ? The clock handling does not matter - this is just
> select of schema for the child node.

Ah.... I'm sorry, I misinterpreted the email. Yes, having only a single
compat here is perfectly fine. Please excuse me for the confusion.

-- 
With best wishes
Dmitry
