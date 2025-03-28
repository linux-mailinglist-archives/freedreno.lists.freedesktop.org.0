Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3FFA74A03
	for <lists+freedreno@lfdr.de>; Fri, 28 Mar 2025 13:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A9E10E1B0;
	Fri, 28 Mar 2025 12:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="blnYZH+h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4738810E1D2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 12:45:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5RqRd025664
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 12:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZvDweKJ9jTquauiqzG4b1vQJ
 jhiOyV8IbduQk2WD+80=; b=blnYZH+h7EjirwAzcI4rQ32cFhE+R+dQR+LBH9aO
 2eGnXcQlP/4wesPahwAB1U2VKXUr8HjJsyyLxVuEs6cOQzQWCHcAq+MbpX35wIB3
 TFRsOpUfKg17qbB/6ot88MRyPrZ4VNlfa7alYOS0pcIpa/vOJzG5LXOT21+oB9PC
 Jzmy/zxyo2OkYViVK2xfWTgux19RNXeAmxyRHGvYCGbBea/gO0dUKBiWrv5YHvgq
 /5iLFn9HMP8LQN8iRFkZmunDXcGt/jfugSokcNQSUEshyYKjn4o9o8jABM+OP7VG
 6+wu7iLAm6VvBOXHG6RqbQVb6jXIiSPvryTu9z02LzNJfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nuvnps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 12:45:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3b53373faso298437685a.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 05:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743165933; x=1743770733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZvDweKJ9jTquauiqzG4b1vQJjhiOyV8IbduQk2WD+80=;
 b=Grlu9sj4nJTnLINTfBqrdkupUVylouwCV5YyoG8BartR7BWsKMaiGJFld5iZkx43KB
 caRIo5IrJVo7IC7BhwSEhKK8wqiVLqKp2Q9x7/Y3E36c1vk7ciSuE7VQu/me0RFLDGu3
 UqaTtODAcKiqKUkdy0ANVhkmxDTVFKj/axsv9DVuEJASCD3nIE4wAWh/RJgZT3fzpF1i
 Iti3xAaijlFzeIAeivXM6Leaz71f1rvBblvJR+ajNOyXvW6tQdR4p/9C58x1SwDk9XMX
 TKLYZEpq2wjs3hu5++O+QgpYHL62a1ePnzfrvn2qTcU2omMp/kV5PGHSNpJ5uJXwnzwD
 x9oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ7hfJrp65spPfnXjrrPCvEZIamxeRKWWcIH4ZKhtErf8nkttUWYU/ElyXmiKfSWCp8DwwbNGpvfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBmrJfkcGHm1CiBOB48ojWP3hx3BNHQdZqlAD2qBSRmd6Fn9jK
 rvhkZhM81V/O0clPOQeeTpX03qGYfPDN3EPEIbwhscoKEQ++i04ngaIKhIuqmypTJ6oZ8hePDac
 RVEGRRXKcytj1Vo3CQiiY3coPOFyK33I6b1XurKzbcclEH0UyIN8n0THqzVffUwoFil4=
X-Gm-Gg: ASbGnctak+6fkkQtBf5GUREsjz9bHbp/lFsV4Po3rDz5TIKD2LD0uCATfsSp2DcaBuM
 c+epQA2hLYMcSvfItUq1uBUEmFOSZsAmamg7BrctXfX4fNaAnIGmV0A35m6CjYO16ZvO9DkbG/s
 xiZDqPC4mYZZw27bH4mL4VUbp2bIC96s/FR3SZlq11z+HmE9F7OlMRkPk6zsoZhGzbqKzRxqPm0
 ocAGihKNd5/lz9hu7scpCdAwlUpR/GSc915LYWlcfqwFEXh7oBLRv8R9m4g6+p4eXjLD22roclO
 CRwk+3vt7DjDft5VFtVlPwhaJnBvqkPv4t9NBwrVzD6relPxtkZu7qrexSdsxakhs2BU/xXiIz+
 NGe8=
X-Received: by 2002:a05:620a:4256:b0:7c5:5d9b:b626 with SMTP id
 af79cd13be357-7c5eda60393mr1455858585a.36.1743165933074; 
 Fri, 28 Mar 2025 05:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjKaK0W01377SicHB6sGo3m+FuXvOv4Bo+AmDgxKUrLAkFj22Hu7JKxWtiIehA4px01G9TUw==
X-Received: by 2002:a05:620a:4256:b0:7c5:5d9b:b626 with SMTP id
 af79cd13be357-7c5eda60393mr1455852085a.36.1743165932495; 
 Fri, 28 Mar 2025 05:45:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b4c84esm3553171fa.77.2025.03.28.05.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 05:45:31 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:45:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
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
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <zzcd4pv7laryb2c5wkuwrhj2ih3lciqgxfyefj4qmi5clxftbi@ykpy42anl4jm>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
X-Proofpoint-GUID: imybIbUhVDiC2-oMiuc5qCqKCP6U-ipk
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e699ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=6YaBRE2yWWFYFR57820A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: imybIbUhVDiC2-oMiuc5qCqKCP6U-ipk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=777
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280088
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

On Fri, Mar 28, 2025 at 03:13:57PM +0530, Ayushi Makhija wrote:
> > These both above commented from Dmitry I have addressed in the version 2 of patch 7 of the series.
> > I have squash patch 8 into patch 7 of version 1 into patch 7 of version 2 of the series.
> > 
> > 
> > Thanks,
> > Ayushi
> 
> Hi Krzysztof,
> 
> I hope this message finds you well. I wanted to follow up on the reply I sent. Your feedback is invaluable to us, and we would greatly appreciate any further insights or comments you might have.
> 

Granted the lack of response, please make sure that you've addressed all
the comments and proceed with the next iteration of the patchset.

-- 
With best wishes
Dmitry
